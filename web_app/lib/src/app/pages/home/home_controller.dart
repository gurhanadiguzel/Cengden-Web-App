import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class HomeController extends Controller {
  final String typeFilter;

  HomeController(
    ItemRepository itemRepository,
    UserRepository userRepository,
    this.typeFilter,
  )   : itemRepository = itemRepository,
        userRepository = userRepository;

  ItemRepository itemRepository;
  UserRepository userRepository;

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
    await itemRepository.getAccessToken();
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
    computers = await itemRepository.getComputers();
    phones = await itemRepository.getPhones();
    vehicles = await itemRepository.getVehicles();
    privateLessons = await itemRepository.getPrivateLessons();

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
