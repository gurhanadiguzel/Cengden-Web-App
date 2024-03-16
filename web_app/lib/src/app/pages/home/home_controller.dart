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
  HomeController(
    ItemRepository itemRepository,
    UserRepository userRepository,
  )   : _itemRepository = itemRepository,
        _userRepository = userRepository;

  ItemRepository _itemRepository;
  UserRepository _userRepository;

  List<Item> items = [];
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
    items = await _itemRepository.getItems();
    endIndex = 10;
    if (items.length < endIndex) {
      endIndex = items.length;
    }
    isGetItemsFetched = true;
    refreshUI();
  }
}
