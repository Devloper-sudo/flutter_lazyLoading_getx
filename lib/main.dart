import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtutorial/screen/listing_screen.dart';

import 'bindings/listing_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx Tutorial",
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: "/listing_screen",
      getPages: [
        GetPage(
            name: '/listing_screen',
            page: () => ListingScreen(),
            binding: ListingBindings())
      ],
    );
  }
}
