import 'dart:convert';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:http/http.dart' as https;
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class HomeController extends Controller {
  final String typeFilter;

  HomeController(
    ItemRepository itemRepository,
    UserRepository userRepository,
    this.typeFilter,
  )   : _itemRepository = itemRepository,
        _userRepository = userRepository;

  ItemRepository _itemRepository;
  UserRepository _userRepository;

  List<Item> items = [];
  List<Item> computers = [];
  List<Item> phones = [];
  List<Item> vehicles = [];
  List<Item> privateLessons = [];
  int itemsPerPage = 10;
  int currentPage = 0;
  int startIndex = 0;
  int endIndex = 10;

  bool isGetItemsFetched = false;

  @override
  void onInitState() async {
    super.onInitState();
    await _itemRepository.getAccessToken();
    getItems();
  }

  @override
  void initListeners() {}

  void setNextPage() {
    currentPage++;
    startIndex = currentPage * itemsPerPage;
    endIndex = items.length > (startIndex + itemsPerPage) ? startIndex + itemsPerPage : items.length;
    refreshUI();
  }

  void setBackPage() {
    currentPage--;
    startIndex = currentPage * itemsPerPage;
    endIndex = startIndex + itemsPerPage;
    refreshUI();
  }

  void getItems() async {
    computers = await _itemRepository.getComputers();
    phones = await _itemRepository.getPhones();
    vehicles = await _itemRepository.getVehicles();
    privateLessons = await _itemRepository.getPrivateLessons();

    filterComputers();

    endIndex = 10;
    if (items.length < endIndex) {
      endIndex = items.length;
    }
    isGetItemsFetched = true;
    refreshUI();
  }

  void filterComputers() async {
    if (typeFilter == 'computers') {
      items = computers;
    } else if (typeFilter == 'phones') {
      items = phones;
    } else if (typeFilter == 'vehicles') {
      items = vehicles;
    } else if (typeFilter == 'privateLessons') {
      items = privateLessons;
    } else {
      items = computers + phones + vehicles + privateLessons;
      items.shuffle();
    }
  }
}
