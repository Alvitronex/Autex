import 'package:autex/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:autex/screens/screens.dart';

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
      _showMessage('Inicio de sesión exitoso', isError: false);

// Verificar credenciales de prueba
      if (email == AppConstants.testEmail &&
          password == AppConstants.testPassword) {
        // Simular un inicio de sesión exitoso
        _showMessage(AppConstants.loginSuccess, isError: false);

// Navegar a la pantalla del dashboard
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 60),

              // Logo
              Icon(
                Icons.directions_car,
                size: 80,
                color: Color(AppConstants.primaryColor),
              ),

              SizedBox(height: 20),

              // Titulo
              Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),

              SizedBox(height: 8),

              //Campos de texto
              _buildEmailField(),
              SizedBox(height: 16),
              // Campo de contraseña
              _buildPasswordField(),
              SizedBox(height: 32),

              // Boton de inicio de sesión
              _buildLoginButton(),
              SizedBox(height: 24),

              //informacion pra pruebas
              _buildTestInfo(),
            ],
          ),
        ),
      ),
    );
  }

// Campos de texto para email y contraseña
  Widget _buildEmailField() {
    return TextField(
      autocorrect: true,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
          labelText: 'Contraseña',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(AppConstants.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildTestInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        children: [
          Text(
            'Datos de prueba unitaria:',
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ${AppConstants.testEmail}',
            style: TextStyle(color: Colors.blue[700]),
          ),
          SizedBox(height: 8),
          Text(
            'Password: ${AppConstants.testPassword}',
            style: TextStyle(color: Colors.blue[700]),
          ),
        ],
      ),
    );
  }
}
