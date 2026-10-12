import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop/pages/welcome_page.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    // DevicePreview(enabled: !kReleaseMode, builder: (context) => SneakerShop()),
    SneakerShop(),
  );
}

class SneakerShop extends StatelessWidget {
  const SneakerShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Sneakers Shop',
      home: WelcomePage(),
    );
  }
}
