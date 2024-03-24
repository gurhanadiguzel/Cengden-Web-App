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

  String? category;
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
  void setCategory(String? value) {
    category = value;
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
  @override
  void setType(String? value) {
    type = value;
    refreshUI();
  }

  @override
  void setBrand(String? value) {
    brand = value;
    refreshUI();
  }

  @override
  void setModel(String? value) {
    model = value;
    refreshUI();
  }

  @override
  void setYear(String? value) {
    year = value;
    refreshUI();
  }

  @override
  void setProcessor(String? value) {
    processor = value;
    refreshUI();
  }

  @override
  void setRAM(String? value) {
    ram = value;
    refreshUI();
  }

  @override
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

  @override
  void setGraphicCard(String? value) {
    graphicCard = value;
    refreshUI();
  }

  @override
  void setOperatingSystem(String? value) {
    operatingSystem = value;
    refreshUI();
  }

  // Phone Setters
  @override
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

  @override
  void setStoragePhone(String? value) {
    batteryCapacity = value;
    refreshUI();
  }

  @override
  void setBatteryCapacity(String? value) {
    batteryCapacity = value;
    refreshUI();
  }

  // Car Setters
  @override
  String? getCarType() {
    return type;
  }

  @override
  void setColor(String? value) {
    color = value;
    refreshUI();
  }

  @override
  void setEngineDisplacement(String? value) {
    engineDisplacement = value;
    refreshUI();
  }

  @override
  void setFuelType(String? value) {
    fuelType = value;
    refreshUI();
  }

  @override
  void setTransmissionType(String? value) {
    transmissionType = value;
    refreshUI();
  }

  @override
  void setMileage(String? value) {
    mileage = value;
    refreshUI();
  }

  @override
  void setRange(String? value) {
    range = value;
    refreshUI();
  }

  @override
  void setBedCapacity(String? value) {
    bedCapacity = value;
    refreshUI();
  }

  @override
  void setWaterTankCapacity(String? value) {
    waterTankCapacity = value;
    refreshUI();
  }

  @override
  void setPayloadCapacity(String? value) {
    payloadCapacity = value;
    refreshUI();
  }

  // Private Lessons Setters
  @override
  void setTutorName(String? value) {
    tutorName = value;
    refreshUI();
  }

  @override
  void setLessons(String? value) {
    lessons = value!.split(',');
    refreshUI();
  }

  @override
  void setLocation(String? value) {
    location = value;
    refreshUI();
  }

  @override
  void setDuration(String? value) {
    duration = value;
    refreshUI();
  }

  void toggleDetailsDisplay(bool value) {
    isDetailsDisplayed = !isDetailsDisplayed;
    refreshUI();
  }

  void addItem() {
    if (category != null) {
      switch (category) {
        case 'Computer':
          item = Computer(
            id: '',
            category: category!,
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getCurrentUser()!,
            createdDate: DateTime.now().toString(),
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
        case 'Phone':
          item = Phone(
            id: '',
            category: category!,
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getCurrentUser()!,
            createdDate: DateTime.now().toString(),
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
        case 'Vehicle':
          item = Vehicle(
            id: '',
            category: category!,
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getCurrentUser()!,
            createdDate: DateTime.now().toString(),
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
        case 'PrivateLesson':
          item = PrivateLesson(
            id: '',
            category: category!,
            title: title!,
            price: price!,
            imageUrl: imageUrl!,
            description: description!,
            createdBy: _userRepository.getCurrentUser()!,
            createdDate: DateTime.now().toString(),
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
