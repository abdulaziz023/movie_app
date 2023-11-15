import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/common/service/db_service.dart';
import 'src/common/widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  $storage = await SharedPreferences.getInstance();

  runApp(const App());
}
