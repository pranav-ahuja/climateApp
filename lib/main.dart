import 'package:climate_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Climate());
}

class Climate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Climate"),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
