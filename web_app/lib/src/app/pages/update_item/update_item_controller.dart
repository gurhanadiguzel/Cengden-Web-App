import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';
import 'package:web_app/src/domain/repositories/item_controller.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class UpdateItemController extends Controller implements ItemController {
  UpdateItemController(
    ItemRepository itemRepository,
    UserRepository userRepository,
    this.item,
  )   : _itemRepository = itemRepository,
        _userRepository = userRepository;

  UserRepository _userRepository;
  ItemRepository _itemRepository;
  Item item;

  @override
  void initListeners() {}

  void updateItem() {
    // Implement logic to update the item
  }

  @override
  void onInitState() {
    super.onInitState();
    // Implement logic to fetch the selected item using itemId
    // Populate the fields with the item's current values
  }

  void setTitle(String? value) {
    item.title = value ?? item.title;
    refreshUI();
  }

  void setPrice(String? value) {
    item.price = value ?? item.price;
    refreshUI();
  }

  void setImageUrl(String? value) {
    item.imageUrl = value ?? item.imageUrl;
    refreshUI();
  }

  void setDescription(String? value) {
    item.description = value ?? item.description;
    refreshUI();
  }

  @override
  void setBrand(String? value) {
    // TODO: implement setBrand
  }

  @override
  void setGraphicCard(String? value) {
    // TODO: implement setGraphicCard
  }

  @override
  void setModel(String? value) {
    // TODO: implement setModel
  }

  @override
  void setOperatingSystem(String? value) {
    // TODO: implement setOperatingSystem
  }

  @override
  void setProcessor(String? value) {
    // TODO: implement setProcessor
  }

  @override
  void setRAM(String? value) {
    // TODO: implement setRAM
  }

  @override
  void setStorageComputer(String? value) {
    // TODO: implement setStorageComputer
  }

  @override
  void setType(String? value) {
    // TODO: implement setType
  }

  @override
  void setYear(String? value) {
    // TODO: implement setYear
  }

  @override
  String? getCarType() {
    if (item is Vehicle) {
      Vehicle vehicle = item as Vehicle;
      return vehicle.type;
    }
  }

  @override
  void setBatteryCapacity(String? value) {
    // TODO: implement setBatteryCapacity
  }

  @override
  void setBedCapacity(String? value) {
    // TODO: implement setBedCapacity
  }

  @override
  void setCameraSpesifications(String? value) {
    // TODO: implement setCameraSpesifications
  }

  @override
  void setColor(String? value) {
    // TODO: implement setColor
  }

  @override
  void setEngineDisplacement(String? value) {
    // TODO: implement setEngineDisplacement
  }

  @override
  void setFuelType(String? value) {
    // TODO: implement setFuelType
  }

  @override
  void setMileage(String? value) {
    // TODO: implement setMileage
  }

  @override
  void setPayloadCapacity(String? value) {
    // TODO: implement setPayloadCapacity
  }

  @override
  void setRange(String? value) {
    // TODO: implement setRange
  }

  @override
  void setStoragePhone(String? value) {
    // TODO: implement setStoragePhone
  }

  @override
  void setTransmissionType(String? value) {
    // TODO: implement setTransmissionType
  }

  @override
  void setWaterTankCapacity(String? value) {
    // TODO: implement setWaterTankCapacity
  }

  @override
  void setDuration(String? value) {
    // TODO: implement setDuration
  }

  @override
  void setLessons(String? value) {
    // TODO: implement setLessons
  }

  @override
  void setLocation(String? value) {
    // TODO: implement setLocation
  }

  @override
  void setTutorName(String? value) {
    // TODO: implement setTutorName
  }
}
