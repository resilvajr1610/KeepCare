import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Model/export.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}