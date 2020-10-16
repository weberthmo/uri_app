
import 'package:flutter/material.dart';
import 'package:uri_app/paginas/home.dart';

Future<void> main() async {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    title: "URI APP",
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),

    home: Home(),
  )
  );

}