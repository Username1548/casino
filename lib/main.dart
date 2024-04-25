import 'package:casino/core/shared_preferences_singletone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/application.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}
