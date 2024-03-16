import 'package:flutter/material.dart';

final kFadeInDuration = Duration(milliseconds: 365);

const kPrimaryColor = Color(0xFFD2202F);
Color kPrimaryColorPale = kPrimaryColor.withOpacity(0.6);
Color kPrimaryColorHint = kPrimaryColor.withOpacity(0.5);

const kBlack = Colors.black;
Color kBlackPale = kBlack.withOpacity(0.7);
Color kBlackHint = kBlack.withOpacity(0.5);

const kWhite = Colors.white;
const kBorderColor = Color(0xffD8DADC);
const kBackgroundColor = Color(0xffF8F8F8);

final kDeactiveColor = Color(0xff000000).withOpacity(0.25);

TextStyle kTitleStyle({Color? color}) {
  return TextStyle(
    color: color ?? kBlack,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );
}

TextStyle kSubtitleStyle({Color? color}) {
  return TextStyle(
    color: color ?? kBlackPale,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kAppBarTitleStyle() {
  return TextStyle(
    color: kBlack,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
}

const jsonString = '''
[
    {
        "_id": {
            "\$oid": "65f2e226bdd51fdeb11d8a5b"
        },
        "Title": "Dell XPS 13",
        "Type": "Notebook",
        "Brand": "Dell",
        "Model": "XPS 13",
        "Year": "2022",
        "Processor": "Intel Core i7-1185G7",
        "RAM": "16 GB",
        "Storage": {
            "SSD": "512 GB SSD"
        },
        "Graphics Card": "Intel Iris Xe Graphics",
        "Operating System": "Windows 11",
        "Price": "\$1,599",
        "Image": "images/porsche.jpg",
        "Description": "Slim and powerful notebook with a stunning 13-inch display, ideal for professionals on the go."
    },
    {
        "_id": {
            "\$oid": "65f2f371bdd51fdeb11d8a5c"
        },
        "Title": "Apple MacBook Pro 16-inch",
        "Type": "Notebook",
        "Brand": "Apple",
        "Model": "MacBook Pro",
        "Year": "2021",
        "Processor": "Apple M1 Pro",
        "RAM": "16 GB",
        "Storage": {
            "SSD": "512 GB SSD",
            "HDD": "1 TB HDD"
        },
        "Graphics Card": "Apple M1 Pro",
        "Operating System": "macOS Monterey",
        "Price": "\$2,499",
        "Image": "images/porsche.jpg",
        "Description": "Powerful MacBook Pro with stunning Retina display, perfect for creative professionals."
    },
     {
        "_id": {
            "\$oid": "65f2f47bbdd51fdeb11d8a5d"
        },
        "Title": "Samsung Galaxy S21 Ultra",
        "Brand": "Samsung",
        "Model": "S21 Ultra",
        "Year": "2021",
        "Operating System": "Android 11",
        "Processor": "Exynos 2100",
        "RAM": "12 GB",
        "Storage": "256 GB",
        "Camera Specifications": {
            "Main": "108MP",
            "Front": "40MP",
            "Periscope Telephoto": "12MP",
            "Telephoto": "10MP"
        },
        "Battery Capacity": "5000 mAh",
        "Price": "\$1,199",
        "Image": "images/porsche.jpg",
        "Description": "Flagship Samsung phone with top-tier specs and advanced camera features."
    },
    {
        "_id": {
            "\$oid": "65f2f5c3bdd51fdeb11d8a5e"
        },
        "Title": "iPhone 13 Pro Max",
        "Brand": "Apple",
        "Model": "13 Pro Max",
        "Year": "2021",
        "Operating System": "iOS 15",
        "Processor": "Apple A15 Bionic",
        "RAM": "6 GB",
        "Storage": "512 GB",
        "Camera Specifications": {
            "Main": "12MP",
            "Ultra Wide": "12MP",
            "Telephoto": "12MP"
        },
        "Battery Capacity": "4352 mAh",
        "Price": "\$1,099",
        "Image": "images/porsche.jpg",
        "Description": "Super iPhone offering from Apple with improved camera capabilities and long battery life."
    },
        {
        "_id": {
            "\$oid": "65f2f6f9bdd51fdeb11d8a61"
        },
        "Title": "Toyota Corolla 2020",
        "Type": "Sedan",
        "Brand": "Toyota",
        "Model": "Corolla",
        "Year": "2020",
        "Color": "Silver",
        "EngineDisplacement": "1.8 cc",
        "FuelType": "Petrol",
        "TransmissionType": "Automatic",
        "Mileage": "20,000 km",
        "Price": "\$15,000",
        "Image": "images/porsche.jpg",
        "Description": "good car"
    },
    {
        "_id": {
            "\$oid": "65f2f707bdd51fdeb11d8a62"
        },
        "Title": "Honda Civic 2018",
        "Type": "Sedan",
        "Brand": "Honda",
        "Model": "Civic",
        "Year": "2018",
        "Color": "White",
        "EngineDisplacement": "1.5L",
        "FuelType": "Petrol",
        "TransmissionType": "CVT",
        "Mileage": "25,000 km",
        "Price": "\$12,500",
        "Image": "images/porsche.jpg",
        "Description": "good condition Civic with low mileage"
    },
    {
        "_id": {
            "\$oid": "65f2f715bdd51fdeb11d8a63"
        },
        "Title": "Tesla Model S",
        "Type": "Electric Car",
        "Brand": "Tesla",
        "Model": "Model S",
        "Year": "2022",
        "Color": "Red",
        "EngineDisplacement": "N/A",
        "FuelType": "Electric",
        "TransmissionType": "Automatic",
        "Mileage": "10,000 km",
        "Price": "\$80,000",
        "Image": "images/porsche.jpg",
        "Description": "Luxurious electric sedan with autopilot feature",
        "BatteryCapacity": "100 kWh",
        "Range": "350 km"
    },
    {
        "_id": {
            "\$oid": "65f2f723bdd51fdeb11d8a64"
        },
        "Title": "Airstream Flying Cloud 25FB",
        "Type": "Caravan",
        "Brand": "Airstream",
        "Model": "Flying Cloud 25FB",
        "Year": "2023",
        "Color": "Silver",
        "EngineDisplacement": "3.0L",
        "FuelType": "Diesel",
        "TransmissionType": "Manual",
        "Mileage": "15,000 miles",
        "Price": "\$40,000",
        "Image": "images/porsche.jpg",
        "Description": "Spacious travel trailer for outdoor adventures",
        "BedCapacity": "Sleeps 4",
        "WaterTankCapacity": "50 liters"
    },
    {
        "_id": {
            "\$oid": "65f2f72ebdd51fdeb11d8a65"
        },
        "Title": "Ford F-150 2020",
        "Type": "Truck",
        "Brand": "Ford",
        "Model": "F150",
        "Year": "2020",
        "Color": "Black",
        "EngineDisplacement": "3.5L V6",
        "FuelType": "Petrol",
        "TransmissionType": "Automatic",
        "Mileage": "30,000 km",
        "Price": "\$35,000",
        "Image": "images/porsche.jpg",
        "Description": "Powerful pickup truck for various tasks",
        "PayloadCapacity": "1500 kg"
    },
    {
        "_id": {
            "\$oid": "65f2f5e8bdd51fdeb11d8a5f"
        },
        "Title": "Programming Fundamentals Course",
        "TutorName": "John Smith",
        "Lessons": [
            "Data Structures",
            "Algorithms",
            "C++"
        ],
        "Location": "Online",
        "Duration": "1 hour/session",
        "Price": "\$60",
        "Image": "images/porsche.jpg",
        "Description": "Comprehensive course covering programming fundamentals including Data Structures, Algorithms, and C++."
    },
    {
        "_id": {
            "\$oid": "65f2f6a7bdd51fdeb11d8a60"
        },
        "Title": "Python Programming Course",
        "TutorName": "Emily Johnson",
        "Lessons": [
            "Python Programming"
        ],
        "Location": "In-Person (Studio)",
        "Duration": "45 minutes/session",
        "Price": "\$50",
        "Image": "images/porsche.jpg",
        "Description": "Learn Python programming from scratch or improve your existing skills with personalized lessons."
    }
]
''';
