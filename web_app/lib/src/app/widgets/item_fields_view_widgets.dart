import 'package:flutter/material.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

class ComputerView extends StatelessWidget {
  final Computer computer;
  final User? user;

  const ComputerView({
    super.key,
    required this.computer,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
              computer.type != null ? computer.type! : '',
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
              computer.brand != null ? computer.brand! : '',
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
              computer.graphicsCard ?? 'N/A',
              style: kSubtitleStyle(),
            ),
            SizedBox(height: 16),
            Text(
              'Operating System:',
              style: kAppBarTitleStyle(),
            ),
            Text(
              computer.operatingSystem ?? 'N/A',
              style: kSubtitleStyle(),
            ),
            SizedBox(height: 16),
            computer.isDetailsDisplayed || user != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Information:',
                        style: kAppBarTitleStyle(),
                      ),
                      Text(
                        "-${computer.createdBy.email}",
                        style: kSubtitleStyle(),
                      ),
                      Text(
                        "-${computer.createdBy.phoneNumber}",
                        style: kSubtitleStyle(),
                      ),
                    ],
                  )
                : Container(),
          ],
        ],
      ),
    );
  }
}

class PhoneView extends StatelessWidget {
  final Phone phone;
  final User? user;

  const PhoneView({
    super.key,
    required this.phone,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
          SizedBox(height: 16),
          phone.isDetailsDisplayed || user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information:',
                      style: kAppBarTitleStyle(),
                    ),
                    Text(
                      "-${phone.createdBy.email}",
                      style: kSubtitleStyle(),
                    ),
                    Text(
                      "-${phone.createdBy.phoneNumber}",
                      style: kSubtitleStyle(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class VehicleView extends StatelessWidget {
  final Vehicle vehicle;
  final User? user;

  const VehicleView({
    super.key,
    required this.vehicle,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
            vehicle.brand != null ? vehicle.brand! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Model:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.model != null ? vehicle.model! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Year:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.year != null ? vehicle.year! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Color:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.color != null ? vehicle.color! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Engine Displacement:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.engineDisplacement != null ? vehicle.engineDisplacement! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Fuel Type:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.fuelType != null ? vehicle.fuelType! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Transmission Type:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.transmissionType != null ? vehicle.transmissionType! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          Text(
            'Mileage:',
            style: kAppBarTitleStyle(),
          ),
          Text(
            vehicle.mileage != null ? vehicle.mileage! : '',
            style: kSubtitleStyle(),
          ),
          SizedBox(height: 16),
          vehicle.type == 'Electric Car'
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Battery Capacity:',
                      style: kAppBarTitleStyle(),
                    ),
                    Text(
                      vehicle.batteryCapacity != null ? vehicle.batteryCapacity! : '',
                      style: kSubtitleStyle(),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Range:',
                      style: kAppBarTitleStyle(),
                    ),
                    Text(
                      vehicle.range != null ? vehicle.range! : '',
                      style: kSubtitleStyle(),
                    ),
                  ],
                )
              : vehicle.type == 'Caravan'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bed Capacity:',
                          style: kAppBarTitleStyle(),
                        ),
                        Text(
                          vehicle.bedCapacity != null ? vehicle.bedCapacity! : '',
                          style: kSubtitleStyle(),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Water Tank Capacity:',
                          style: kAppBarTitleStyle(),
                        ),
                        Text(
                          vehicle.waterTankCapacity != null ? vehicle.waterTankCapacity! : '',
                          style: kSubtitleStyle(),
                        ),
                      ],
                    )
                  : vehicle.type == 'Truck'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payload Capacity:',
                              style: kAppBarTitleStyle(),
                            ),
                            Text(
                              vehicle.payloadCapacity != null ? vehicle.payloadCapacity! : '',
                              style: kSubtitleStyle(),
                            ),
                          ],
                        )
                      : SizedBox(),
          SizedBox(height: 16),
          vehicle.isDetailsDisplayed || user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information:',
                      style: kAppBarTitleStyle(),
                    ),
                    Text(
                      "-${vehicle.createdBy.email}",
                      style: kSubtitleStyle(),
                    ),
                    Text(
                      "-${vehicle.createdBy.phoneNumber}",
                      style: kSubtitleStyle(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class PrivateLessonView extends StatelessWidget {
  final PrivateLesson privateLesson;
  final User? user;

  const PrivateLessonView({
    super.key,
    required this.privateLesson,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
          privateLesson.isDetailsDisplayed || user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information:',
                      style: kAppBarTitleStyle(),
                    ),
                    Text(
                      "-${privateLesson.createdBy.email}",
                      style: kSubtitleStyle(),
                    ),
                    Text(
                      "-${privateLesson.createdBy.phoneNumber}",
                      style: kSubtitleStyle(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
