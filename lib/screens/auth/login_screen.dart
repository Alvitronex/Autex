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
      // _showMessage('Inicio de sesión exitoso', isError: false);

// Verificar credenciales de prueba
      if (email == AppConstants.testEmail &&
          password == AppConstants.testPassword) {
        // Simular un inicio de sesión exitoso
        _showMessage(AppConstants.loginSuccess, isError: false);

// Navegar a la pantalla del dashboard
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
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
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 20),
              // Logo
              Icon(
                Icons.directions_car,
                size: 80,
                color: Color(AppConstants.primaryColor),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Buen día',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              // Titulo

              Text(
                'Iniciar sesión para continuar y registrar tu vehículo',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildEmailField(),
                    SizedBox(height: 30),
                    _buildPasswordField(),
                    SizedBox(height: 10),
                    _buildForgetPasswordField(),
                    SizedBox(height: 10),
                    _buildLoginButton(),
                    SizedBox(height: 20),
                    _buildRegisterButton(),
                  ],
                ),
              ),
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
        labelText: 'Correo Electrónico',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true, // Campo con fondo blanco
        fillColor: Colors.white, // Color de fondo del campo
        hintText: 'Ingrese su correo electrónico',
        hintStyle: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon:
              Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
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
        fillColor: Colors.white,
        hintText: 'Ingrese su contraseña',
        hintStyle: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        // usando un diseno mas tipo metraildesing 3
        onPressed: _isLoading
            ? null
            : _login, // cambiar la ejecucion del boton si esta cargando
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(AppConstants.secondColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isLoading
            ? CircularProgressIndicator(
                // Indicador de carga
                color: Colors.blue,
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
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
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

Widget _buildForgetPasswordField() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          // Acción para recuperar contraseña
        },
        child: Text(
          '¿Olvidé mi contraseña?',
          style: TextStyle(
            color: Color(AppConstants.primaryColor),
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}

Widget _buildRegisterButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('¿No tienes cuenta?'),
      TextButton(
        onPressed: () {},
        child: Text(
          'Registrarse',
          style: TextStyle(
            color: Color(AppConstants.primaryColor),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
