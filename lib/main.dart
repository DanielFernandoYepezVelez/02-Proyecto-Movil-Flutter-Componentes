import 'package:flutter/material.dart';

// import 'package:flutter_components/src/pages/home_temp.dart';
import 'package:flutter_components/src/pages/home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(title: 'Material App', home: HomePageTemp());
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}