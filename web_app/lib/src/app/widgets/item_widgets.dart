import 'package:flutter/material.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

class ComputerView extends StatelessWidget {
  const ComputerView({
    super.key,
    required this.computer,
  });

  final Computer computer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with image
          Container(
            width: size.width / 2.5,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                computer.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Right side with details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  computer.title,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Description:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  computer.description,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Price:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  computer.price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                if (computer.type != null) ...[
                  Text(
                    'Type:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.type!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (computer.brand != null) ...[
                  Text(
                    'Brand:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.brand!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Model:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.model ?? 'N/A',
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Year:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.year ?? 'N/A',
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Processor:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.processor ?? 'N/A',
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'RAM:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.ram ?? 'N/A',
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Storage:',
                    style: kAppBarTitleStyle(),
                  ),
                  if (computer.storage != null) ...[
                    for (var entry in computer.storage!.entries) Text('${entry.key}: ${entry.value}'),
                  ] else
                    Text('N/A'),
                  SizedBox(height: 16),
                  Text(
                    'Graphic Card:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.graphicCard ?? 'N/A',
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Operating System:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    computer.operatingSystem ?? 'N/A',
                    style: kAppBarTitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneView extends StatelessWidget {
  final Phone phone;

  const PhoneView({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with image
          Container(
            width: size.width / 2.5,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                phone.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Right side with details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  phone.title,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Description:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  phone.description,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Price:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  phone.price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                if (phone.brand != null) ...[
                  Text(
                    'Brand:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.brand!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (phone.model != null) ...[
                  Text(
                    'Model:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.model!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (phone.year != null) ...[
                  Text(
                    'Year:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.year!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (phone.operatingSystem != null) ...[
                  Text(
                    'Operating System:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.operatingSystem!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (phone.processor != null) ...[
                  Text(
                    'Processor:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.processor!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (phone.ram != null) ...[
                  Text(
                    'RAM:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.ram!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                if (phone.storage != null) ...[
                  Text(
                    'Storage:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.storage!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                Text(
                  'Camera Specifications:',
                  style: kAppBarTitleStyle(),
                ),
                if (phone.cameraSpecifications != null) ...[
                  for (var entry in phone.cameraSpecifications!.entries) Text('${entry.key}: ${entry.value}'),
                ] else
                  Text('N/A'),
                SizedBox(height: 16),
                if (phone.batteryCapacity != null) ...[
                  Text(
                    'Battery Capacity:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    phone.batteryCapacity!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleView extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleView({
    super.key,
    required this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with image
          Container(
            width: size.width / 2.5,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                vehicle.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Right side with details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.title,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Description:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.description,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Price:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Type:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.type!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Brand:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.brand!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Model:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.model!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Year:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.year!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Color:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.color!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Engine Displacement:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.engineDisplacement!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Fuel Type:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.fuelType!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Transmission Type:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.transmissionType!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Mileage:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  vehicle.mileage!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                // Add more Text widgets to display other details of the vehicle
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrivateLessonView extends StatelessWidget {
  final PrivateLesson privateLesson;

  const PrivateLessonView({
    super.key,
    required this.privateLesson,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with image
          Container(
            width: size.width / 2.5,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                privateLesson.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Right side with details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  privateLesson.title,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Description:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  privateLesson.description,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Price:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  privateLesson.price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                if (privateLesson.tutorName != null) ...[
                  Text(
                    'Tutor Name:',
                    style: kAppBarTitleStyle(),
                  ),
                  Text(
                    privateLesson.tutorName!,
                    style: kSubtitleStyle(),
                  ),
                  SizedBox(height: 16),
                ],
                Text(
                  'Location:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  privateLesson.location!,
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Duration:',
                  style: kAppBarTitleStyle(),
                ),
                Text(
                  privateLesson.duration ?? 'N/A',
                  style: kSubtitleStyle(),
                ),
                SizedBox(height: 16),
                Text(
                  'Lessons:',
                  style: kAppBarTitleStyle(),
                ),
                if (privateLesson.lessons != null) ...[
                  for (var entry in privateLesson.lessons!) Text(entry),
                ] else
                  Text('N/A'),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
