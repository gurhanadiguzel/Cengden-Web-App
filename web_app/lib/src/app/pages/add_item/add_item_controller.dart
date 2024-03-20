import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';
import 'package:web_app/src/domain/repositories/item_controller.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class AddItemController extends Controller implements ItemController {
  AddItemController(
    UserRepository userRepository,
    ItemRepository itemRepository,
  )   : _userRepository = userRepository,
        _itemRepository = itemRepository;

  UserRepository _userRepository;
  ItemRepository _itemRepository;

  Item? item;
  String? selectedItemType;

  String? title;
  String? price;
  String? imageUrl;
  String? description;
  bool isDetailsDisplayed = false;
  String? type;
  String? brand;
  String? model;
  String? year;
  String? processor;
  String? ram;
  Map<String, String>? computerStorage;
  String? graphicCard;
  String? operatingSystem;

  Map<String, String>? cameraSpecifications;
  String? phoneStorage;
  String? batteryCapacity;

  String? tutorName;
  List<String>? lessons;
  String? location;
  String? duration;

  String? color;
  String? engineDisplacement;
  String? fuelType;
  String? transmissionType;
  String? mileage;
  String? range;
  String? bedCapacity;
  String? waterTankCapacity;
  String? payloadCapacity;

  @override
  void initListeners() {}
  // Item Setters
  void setItemType(String? value) {
    selectedItemType = value;
    refreshUI();
  }

  void setTitle(String? value) {
    title = value;
    refreshUI();
  }

  void setPrice(String? value) {
    price = value;
    refreshUI();
  }

  void setImageUrl(String? value) {
    imageUrl = value;
    refreshUI();
  }

  void setDescription(String? value) {
    description = value;
    refreshUI();
  }

  // Computer Setters
  void setType(String? value) {
    type = value;
    refreshUI();
  }

  void setBrand(String? value) {
    brand = value;
    refreshUI();
  }

  void setModel(String? value) {
    model = value;
    refreshUI();
  }

  void setYear(String? value) {
    year = value;
    refreshUI();
  }

  void setProcessor(String? value) {
    processor = value;
    refreshUI();
  }

  void setRAM(String? value) {
    ram = value;
    refreshUI();
  }

  void setStorageComputer(String? value) {
    if (value != null) {
      computerStorage = Map.fromEntries(
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
      computerStorage = null;
    }
    refreshUI();
  }

  void setGraphicCard(String? value) {
    graphicCard = value;
    refreshUI();
  }

  void setOperatingSystem(String? value) {
    operatingSystem = value;
    refreshUI();
  }

  // Phone Setters
  void setCameraSpesifications(String? value) {
    if (value != null) {
      cameraSpecifications = Map.fromEntries(
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
      cameraSpecifications = null;
    }
    refreshUI();
  }

  void setStoragePhone(String? value) {
    batteryCapacity = value;
    refreshUI();
  }

  void setBatteryCapacity(String? value) {
    batteryCapacity = value;
    refreshUI();
  }

  // Car Setters
  @override
  String? getCarType() {
    return type;
  }

  void setColor(String? value) {
    color = value;
    refreshUI();
  }

  void setEngineDisplacement(String? value) {
    engineDisplacement = value;
    refreshUI();
  }

  void setFuelType(String? value) {
    fuelType = value;
    refreshUI();
  }

  void setTransmissionType(String? value) {
    transmissionType = value;
    refreshUI();
  }

  void setMileage(String? value) {
    mileage = value;
    refreshUI();
  }

  void setRange(String? value) {
    range = value;
    refreshUI();
  }

  void setBedCapacity(String? value) {
    bedCapacity = value;
    refreshUI();
  }

  void setWaterTankCapacity(String? value) {
    waterTankCapacity = value;
    refreshUI();
  }

  void setPayloadCapacity(String? value) {
    payloadCapacity = value;
    refreshUI();
  }

  // Private Lessons Setters
  void setTutorName(String? value) {
    tutorName = value;
    refreshUI();
  }

  void setLessons(String? value) {
    lessons = value!.split(',');
    refreshUI();
  }

  void setLocation(String? value) {
    location = value;
    refreshUI();
  }

  void setDuration(String? value) {
    duration = value;
    refreshUI();
  }

  void toggleDetailsDisplay(bool value) {
    isDetailsDisplayed = !isDetailsDisplayed;
    refreshUI();
  }

  void addItem() {
    if (selectedItemType != null) {
      switch (selectedItemType) {
        case 'computer':
          item = Computer(
            id: '',
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getUser()!,
            isDetailsDisplayed: isDetailsDisplayed,
            type: type,
            brand: brand,
            model: model,
            year: year,
            processor: processor,
            ram: ram,
            storage: computerStorage,
            graphicsCard: graphicCard,
            operatingSystem: operatingSystem,
          );
          break;
        case 'phone':
          item = Phone(
            id: '',
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getUser()!,
            isDetailsDisplayed: isDetailsDisplayed,
            brand: brand,
            model: model,
            year: year,
            operatingSystem: operatingSystem,
            processor: processor,
            ram: ram,
            storage: phoneStorage,
            cameraSpecifications: cameraSpecifications,
            batteryCapacity: batteryCapacity,
          );
          break;
        case 'vehicle':
          item = Vehicle(
            id: '',
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getUser()!,
            isDetailsDisplayed: isDetailsDisplayed,
            type: type,
            brand: brand,
            model: model,
            year: year,
            color: color,
            engineDisplacement: engineDisplacement,
            fuelType: fuelType,
            transmissionType: transmissionType,
            mileage: mileage,
            batteryCapacity: batteryCapacity,
            range: range,
            bedCapacity: bedCapacity,
            waterTankCapacity: waterTankCapacity,
            payloadCapacity: payloadCapacity,
          );
          break;
        case 'privateLesson':
          item = PrivateLesson(
            id: '',
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getUser()!,
            isDetailsDisplayed: isDetailsDisplayed,
            tutorName: tutorName,
            lessons: lessons,
            location: location,
            duration: duration,
          );
          break;
        default:
          break;
      }
    }
    _itemRepository.addItem(item!);
  }
}
