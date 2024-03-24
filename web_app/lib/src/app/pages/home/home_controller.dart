import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class HomeController extends Controller {
  HomeController(
    ItemRepository itemRepository,
    UserRepository userRepository,
    this.typeFilter,
  )   : _itemRepository = itemRepository,
        userRepository = userRepository;

  final ItemRepository _itemRepository;
  final UserRepository userRepository;
  final String typeFilter;

  List<Item>? items = [];

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

  void setNextPage() async {
    currentPage++;
    startIndex = currentPage * itemsPerPage;
    getItems();
    endIndex = (startIndex + items!.length) == (startIndex + itemsPerPage)
        ? startIndex + itemsPerPage
        : (startIndex + items!.length);
    refreshUI();
  }

  void setBackPage() {
    currentPage--;
    startIndex = currentPage * itemsPerPage;
    endIndex = startIndex + itemsPerPage;
    getItems();
    refreshUI();
  }

  void getItems() async {
    isGetItemsFetched = false;

    items = await filterItems();

    if ((startIndex + items!.length) < (startIndex + itemsPerPage)) {
      endIndex = startIndex + items!.length;
    }
    isGetItemsFetched = true;
    refreshUI();
  }

  Future<List<Item>?> filterItems() async {
    if (typeFilter == 'computers') {
      List<Item>? computers = await _itemRepository.getItems("Computer", itemsPerPage, startIndex);
      return computers;
    } else if (typeFilter == 'phones') {
      List<Item>? phones = await _itemRepository.getItems("Phone", itemsPerPage, startIndex);
      return phones;
    } else if (typeFilter == 'vehicles') {
      List<Item>? vehicles = await _itemRepository.getItems("Vehicle", itemsPerPage, startIndex);
      return vehicles;
    } else if (typeFilter == 'privateLessons') {
      List<Item>? privateLessons = await _itemRepository.getItems("PrivateLesson", itemsPerPage, startIndex);
      return privateLessons;
    } else if (typeFilter == 'favoriteItems') {
      List<Item>? favoriteItems =
          await _itemRepository.getFavoriteItems(userRepository.getCurrentUser()!, itemsPerPage, startIndex);
      return favoriteItems;
    } else if (typeFilter == 'myItems') {
      List<Item>? myItems =
          await _itemRepository.getMyItems(userRepository.getCurrentUser()!, itemsPerPage, startIndex);
      return myItems;
    } else {
      List<Item>? allItems = await _itemRepository.getItems(null, itemsPerPage, startIndex);
      return allItems;
    }
  }

  void deleteItemFromFavorites(Item item) async {
    await _itemRepository.deleteItemFromFavorites(userRepository.getCurrentUser()!, item);
    refreshUI();
  }
}
