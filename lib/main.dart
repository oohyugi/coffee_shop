import 'package:coffee_shop/feature/order/order_page.dart';
import 'package:flutter/material.dart';

import 'feature/order/order_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.pink,
          primaryColor: Colors.pink,
          buttonColor: Colors.pink),
      home: OrderPage(),
    );
  }
}
