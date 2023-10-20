import 'package:flutter/material.dart';

import 'Screen/Onbording/OnbordingScrren.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StoreApp",
      home: OnbordingScrren(),
      debugShowCheckedModeBanner: false,
    );
  }
}
