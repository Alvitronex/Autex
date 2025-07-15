import 'package:flutter/material.dart';
import 'package:autex/utils/utils.dart';
import 'package:autex/screens/screens.dart';

void main() => runApp(AutexApp());

class AutexApp extends StatelessWidget {
  const AutexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Nombre de la App
      title: AppConstants.appName,
      // Definir tema para la app
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
