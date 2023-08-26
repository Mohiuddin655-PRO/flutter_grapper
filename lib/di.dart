import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.instance;

Future<void> diInit() async {
  await _base();
  await di.allReady();
}

Future<void> _base() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => preferences);
}
