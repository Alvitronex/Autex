class AppConstants {
  // Nombre de la App
  static const String appName = 'AutexApp';

  // Colores
  static const int primaryColor = 0xFF2196F3; // Azul
  static const int secondColor = 0xFF4CAF50; // Verde
  static const int errorColor = 0xFFF44336; // Rojo
  static const int backgroundButton = 0xFFEEEEEE; // Gris claro
  static const String logoUrl = 'assets/logo.png';

  // Mensajes básicos
  static const String welcomeMessage = 'Bienvenido a $appName';
  static const String loginSuccess = 'Inicio de sesión exitoso';
  static const String loginFailed = 'Email o contraseña incorrectos';

  //test
  static const String testEmail = 'test@test.com';
  static const String testPassword = '123456';
  static const String testUserName = 'usuario de prueba';

  /// Base URL para la API del backend.
  static const String baseUrl = 'http://localhost:8080/api';

  /// Endpoints
  // Autentificación para iniciar sesión.
  static const String login = '$baseUrl/auth/login';
  // Registro de usuario.
  static const String register = '$baseUrl/auth/register';
  // cerrar sesión.
  static const String logout = '$baseUrl/auth/logout';
  // Obtener información del usuario autenticado.
  static const String me = '$baseUrl/auth/me';

  // Obtener vehiculos.
  static const String vehicles = '$baseUrl/vehicles';
  // Obtener partes de vehiculo
  static const String parts = '$baseUrl/parts';
  //Obtener features de vehiculo
  static const String features = '$baseUrl/features';
  // Obtener licencia de vehiculo
  static const String licenses = '$baseUrl/licenses';
}
