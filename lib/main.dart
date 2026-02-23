import 'package:finance_tracker/app/di/injection.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}
