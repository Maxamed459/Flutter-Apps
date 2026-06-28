import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/welcome_page.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => SneakerShop()),
  );
}

class SneakerShop extends StatelessWidget {
  const SneakerShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: WelcomePage(),
    );
  }
}
