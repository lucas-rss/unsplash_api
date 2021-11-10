import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_api/controllers/list_photos_controller.dart';
import 'package:unsplash_api/pages/list_photos_page.dart';
import 'package:unsplash_api/utils/injector.dart';

void main() {
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPhotosPage(
            controller: Get.put(ListPhotosController(GetIt.instance.get()))));
  }
}
