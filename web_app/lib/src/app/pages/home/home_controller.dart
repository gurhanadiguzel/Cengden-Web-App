import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';

class HomeController extends Controller {
  List<Item> items = [];
  @override
  void onInitState() {
    super.onInitState();
    getItems();
  }

  @override
  void initListeners() {}
  void getItems() async {
    try {
      String filePath = 'C:/Users/QP/Desktop/Wep-App/template/computers.json';
      final file = File(filePath);
      final jsonString = await file.readAsString();
      // print(jsonString);
      // final jsonData = json.decode(jsonString);

      // for (var item in jsonData) {
      //   var computer = Computer.fromJson(item);
      //   print(computer.title);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
