import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/item.dart';

class HomeController extends Controller {
  @override
  void initListeners() {}
  List<Item> items = [];
}
