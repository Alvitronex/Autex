// dashboard_screen.dart - FASE 1: Dashboard básico
import 'package:flutter/material.dart';
import 'package:autex/utils/utils.dart';
import 'package:autex/screens/auth/auth.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(AppConstants.primaryColor),
        elevation: 0,
        automaticallyImplyLeading: false, // Quitar botón de volver
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saludo al usuario
            _buildWelcomeCard(),
            SizedBox(height: 24),

            // Título de opciones
            Text(
              'Opciones Principales',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),

            // Grid de opciones
            _buildOptionsGrid(context),
            SizedBox(height: 24),

            // Información adicional
            _buildInfoCard(),
          ],
        ),
      ),

      // Botón flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showComingSoon(context, 'Agregar Vehículo'),
        backgroundColor: Color(AppConstants.primaryColor),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Widget de bienvenida
  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(AppConstants.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hola, ${AppConstants.testUserName}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Bienvenido a tu panel de control',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Grid de opciones principales
  Widget _buildOptionsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        // Perfil
        _buildOptionCard(
          title: 'Perfil',
          icon: Icons.person,
          color: Colors.blue,
          onTap: () => _showComingSoon(context, 'Perfil'),
        ),

        // Mis Vehículos
        _buildOptionCard(
          title: 'Mis Vehículos',
          icon: Icons.directions_car,
          color: Colors.green,
          onTap: () => _showComingSoon(context, 'Mis Vehículos'),
        ),

        // Reportes
        _buildOptionCard(
          title: 'Reportes',
          icon: Icons.analytics,
          color: Colors.orange,
          onTap: () => _showComingSoon(context, 'Reportes'),
        ),

        // Configuración
        _buildOptionCard(
          title: 'Configuración',
          icon: Icons.settings,
          color: Colors.purple,
          onTap: () => _showComingSoon(context, 'Configuración'),
        ),
      ],
    );
  }

  // Widget para cada opción del grid
  Widget _buildOptionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget de información
  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Información de la Cuenta',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Email: ${AppConstants.testEmail}'),
          Text('Estado: Activo'),
          Text('Fase: 1 - Fundamentos'),
        ],
      ),
    );
  }

  // Función de logout
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cerrar Sesión'),
        content: Text('¿Estás seguro que quieres cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar diálogo
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false, // Remover todas las pantallas anteriores
              );
            },
            child: Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }

  // Mostrar mensaje de "próximamente"
  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature estará disponible en las siguientes fases'),
        backgroundColor: Color(AppConstants.primaryColor),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
