import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys {
  language('language'),
  movies('movies');

  const StorageKeys(this.key);

  final String key;
}

late final SharedPreferences $storage;