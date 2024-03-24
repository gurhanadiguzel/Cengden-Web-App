import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/repositories/item_controller.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class UpdateItemController extends Controller implements ItemController {
  UpdateItemController(
    ItemRepository itemRepository,
    UserRepository userRepository,
    this.item,
  ) : _itemRepository = itemRepository;

  final ItemRepository _itemRepository;
  String? previousPrice;
  String? newPrice;
  dynamic item;

  @override
  void initListeners() {}

  void updateItem() async {
    await _itemRepository.updateItem(item);
    if (previousPrice != null && newPrice != null) {
      double prevPrice = double.parse(previousPrice!.replaceAll(RegExp(r'[^0-9]'), ''));
      double updatedPrice = double.parse(newPrice!.replaceAll(RegExp(r'[^0-9]'), ''));
      print(prevPrice);
      print(updatedPrice);
      if (prevPrice > updatedPrice) {
        await _itemRepository.sendUpdatedPriceMail(item, previousPrice, newPrice);
      }
    }
  }

  void toggleDetailsDisplay(bool value) {
    item.isDetailsDisplayed = !item.isDetailsDisplayed;
    refreshUI();
  }

  void toggleVisible(bool value) {
    item.isVisible = !item.isVisible;
    refreshUI();
  }

  void setTitle(String? value) {
    item.title = value ?? item.title;
    refreshUI();
  }

  void setPrice(String? value) {
    if (previousPrice == null) previousPrice = item.price;
    newPrice = value;
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
  void setType(String? value) {
    item.type = value;
    refreshUI();
  }

  @override
  void setBrand(String? value) {
    item.brand = value;
    refreshUI();
  }

  @override
  void setGraphicCard(String? value) {
    item.graphicsCard = value;
    refreshUI();
  }

  @override
  void setModel(String? value) {
    item.model = value;
    refreshUI();
  }

  @override
  void setOperatingSystem(String? value) {
    item.operatingSystem = value;
    refreshUI();
  }

  @override
  void setProcessor(String? value) {
    item.processor = value;
    refreshUI();
  }

  @override
  void setRAM(String? value) {
    item.ram = value;
    refreshUI();
  }

  @override
  void setStorageComputer(String? value) {
    if (value != null) {
      item.storage = Map.fromEntries(
        value.split(',').map(
          (option) {
            final keyValue = option.trim().split(':');
            final key = keyValue[0].trim();
            final value = keyValue[1].trim();
            return MapEntry(key, value);
          },
        ),
      );
    } else {
      item.storage = null;
    }
    refreshUI();
  }

  @override
  void setYear(String? value) {
    item.year = value;
    refreshUI();
  }

  @override
  String getCarType() {
    return item.type;
  }

  @override
  void setBatteryCapacity(String? value) {
    item.batteryCapacity = value;
    refreshUI();
  }

  @override
  void setBedCapacity(String? value) {
    item.bedCapacity = value;
    refreshUI();
  }

  @override
  void setCameraSpesifications(String? value) {
    if (value != null) {
      item.cameraSpecifications = Map.fromEntries(
        value.split(',').map(
          (option) {
            final keyValue = option.trim().split(':');
            final key = keyValue[0].trim();
            final value = keyValue[1].trim();
            return MapEntry(key, value);
          },
        ),
      );
    } else {
      item.cameraSpecifications = null;
    }
    refreshUI();
  }

  @override
  void setColor(String? value) {
    item.color = value;
    refreshUI();
  }

  @override
  void setEngineDisplacement(String? value) {
    item.engineDisplacement = value;
    refreshUI();
  }

  @override
  void setFuelType(String? value) {
    item.fuelType = value;
    refreshUI();
  }

  @override
  void setMileage(String? value) {
    item.mileage = value;
    refreshUI();
  }

  @override
  void setPayloadCapacity(String? value) {
    item.payloadCapacity = value;
    refreshUI();
  }

  @override
  void setRange(String? value) {
    item.range = value;
    refreshUI();
  }

  @override
  void setStoragePhone(String? value) {
    item.storage = value;
    refreshUI();
  }

  @override
  void setTransmissionType(String? value) {
    item.transmissionType = value;
    refreshUI();
  }

  @override
  void setWaterTankCapacity(String? value) {
    item.waterTankCapacity = value;
    refreshUI();
  }

  @override
  void setDuration(String? value) {
    item.duration = value;
    refreshUI();
  }

  @override
  void setLessons(String? value) {
    item.lessons = value!.split(',');
    refreshUI();
  }

  @override
  void setLocation(String? value) {
    item.location = value;
    refreshUI();
  }

  @override
  void setTutorName(String? value) {
    item.tutorName = value;
    refreshUI();
  }
}
