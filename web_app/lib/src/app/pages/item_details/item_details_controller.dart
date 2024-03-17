import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class ItemDetailsController extends Controller {
  ItemDetailsController(
    ItemRepository itemRepository,
    UserRepository userRepository,
  )   : _itemRepository = itemRepository,
        _userRepository = userRepository;

  ItemRepository _itemRepository;
  UserRepository _userRepository;
  @override
  void initListeners() {}
  void deleteItem(Item item) async {
    await _itemRepository.deleteItem(item);
    refreshUI();
  }
}
