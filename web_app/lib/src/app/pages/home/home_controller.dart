import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';

class HomeController extends Controller {
  List<Item> items = [];
  final int itemsPerPage = 10;
  int currentPage = 0;
  int startIndex = 0;
  int endIndex = 10;

  @override
  void onInitState() {
    super.onInitState();
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
    try {
      final jsonData = json.decode(jsonString);

      for (var item in jsonData) {
        var computer = Item.fromJson(item);
        items.add(computer);
        refreshUI();
      }
    } catch (e, st) {
      print("ERROR\n");
      print(e);
      print(st);
      rethrow;
    }
  }
}
