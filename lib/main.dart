import 'package:festival/utilitis/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: "edu"),
      debugShowCheckedModeBanner: false,
      routes: screen,
    ),
  );
}
