import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'src/common/service/db_service.dart';
import 'src/common/widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initialize();

  runApp(const App());
}
