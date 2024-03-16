import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app/src/app.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
