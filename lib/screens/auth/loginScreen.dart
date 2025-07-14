import 'package:autex/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para los campos de texto
  // correo electronico
  final _emailController = TextEditingController();
  // contraseña
  final _passwordController = TextEditingController();
  // ocultar contraseña
  bool _obscurePassword = true;
  // estado de carga
  bool _isLoading = false;
  @override

  // Limpiar controladores al cerrar la pantalla
  void disponse() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //funcion de login simple
  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Validar campos vacíos
    if (email.isEmpty || password.isEmpty) {
      _showMessage('Por favor completa todos los campos', isError: true);
      return;
    }
    // Simular un inicio de sesión exitoso
    setState(() {
      _isLoading = true;
    });

    //Simular delay de 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      _showMessage('Inicio de sesión exitoso');

// Verificar credenciales de prueba
      if (email == AppConstants.testEmail &&
          password == AppConstants.testPassword) {
        // Simular un inicio de sesión exitoso
        _showMessage(AppConstants.loginSuccess, isError: false);

// Navegar a la pantalla del dashboard
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        });
      } else {
        _showMessage(AppConstants.loginFailed, isError: true);
      }
    });
  }

// Mostrar mensajes de error o éxito
  void _showMessage(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: isError
          ? Color(AppConstants.errorColor)
          : Color(AppConstants.secondColor),
      duration: Duration(seconds: 3),
    ));
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
