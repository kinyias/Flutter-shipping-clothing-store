import 'package:shipping_clothing_store/app.dart';
import 'package:shipping_clothing_store/core/utils/http/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  Get.put(NetworkManager()); // Register NetworkManager
  await GetStorage.init();
  runApp(const App());
}
