import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/pages.dart/home_page.dart';
import 'package:storeapp/pages.dart/updateProduct_page.dart';

void main() {
  runApp(const StorApp());
}

class StorApp extends StatelessWidget {
  const StorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home_page.id: (context) => Home_page(),
        Updat_page.id: (context) => Updat_page()
      },
      initialRoute: Home_page.id,
    );
  }
}
