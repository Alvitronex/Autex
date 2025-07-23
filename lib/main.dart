import 'package:flutter/material.dart';
import 'package:autex/utils/utils.dart';
import 'package:autex/screens/screens.dart';

void main() => runApp(AutexApp());

class AutexApp extends StatelessWidget {
  const AutexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Desactivando el banner de depuracion
      debugShowCheckedModeBanner: false,
      // Nombre de la App
      title: AppConstants.appName,
      // Definir tema para la app
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        visualDensity:
            VisualDensity.adaptivePlatformDensity, // Densidad visual adaptativa
      ),
      home: HomeLoginScreen(),
    );
  }
}

// Widget simple de bienvenida (opcional)

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono grande
            Icon(
              Icons.directions_car,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),

            // Título
            Text(
              AppConstants.appName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            // Subtítulo
            Text(
              'Gestión de Vehículos',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 50),

            // Botón para ir al login
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(AppConstants.primaryColor),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Comenzar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
