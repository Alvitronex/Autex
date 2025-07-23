import 'package:autex/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:autex/screens/screens.dart';

import 'dart:async';

class HomeLoginScreen extends StatefulWidget {
  const HomeLoginScreen({super.key});

  @override
  State<HomeLoginScreen> createState() => _EstadoHomeLoginScreen();
}

class _EstadoHomeLoginScreen extends State<HomeLoginScreen> {
  final PageController _controladorPagina = PageController();
  Timer? _temporizador;
  int _paginaActual = 0;

  // 🚗 Diapositivas súper fáciles de entender
  final List<DiapositivaSimple> _diapositivas = [
    DiapositivaSimple(
      titulo: '¡Qué onda! 👋',
      subtitulo: 'Soy tu compa para cuidar tu carrito',
      descripcion: 'Te ayudo a que no se te olvide nada de tu coche',
      emoji: '🚗',
      color: Colors.blue,
    ),
    DiapositivaSimple(
      titulo: 'No Se Te Olvida Nada 📅',
      subtitulo: 'Te aviso cuándo cambiar el aceite',
      descripcion: 'También para las revisiones, llantas y todo lo que ocupa',
      emoji: '🔧',
      color: Colors.green,
    ),
    DiapositivaSimple(
      titulo: 'Tus Papeles 📄',
      subtitulo: 'Aquí guardas todos los documentos',
      descripcion: 'Licencia, seguro, verificación - todo junto y seguro',
      emoji: '📋',
      color: Colors.orange,
    ),
    DiapositivaSimple(
      titulo: 'En Qué Te Gastas 💰',
      subtitulo: 'Te enseño dónde se va tu dinero',
      descripcion: 'Gasolina, arreglos, mantenimiento - todo bien clarito',
      emoji: '📊',
      color: Colors.purple,
    ),
    DiapositivaSimple(
      titulo: '¡No Cuesta Nada! 🎉',
      subtitulo: 'Empieza a cuidar tu carro ahorita',
      descripcion: 'Nomás te tardas 2 minutitos en apuntarte',
      emoji: '✨',
      color: Colors.red,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _iniciarDeslizamientoAutomatico();
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    _controladorPagina.dispose();
    super.dispose();
  }

  void _iniciarDeslizamientoAutomatico() {
    _temporizador = Timer.periodic(const Duration(seconds: 5), (temporizador) {
      if (_paginaActual < _diapositivas.length - 1) {
        _paginaActual++;
      } else {
        _paginaActual = 0;
      }

      _controladorPagina.animateToPage(
        _paginaActual,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  void _pararDeslizamientoAutomatico() {
    _temporizador?.cancel();
  }

  void _reanudarDeslizamientoAutomatico() {
    _iniciarDeslizamientoAutomatico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Logo simple
            _construirEncabezadoSimple(),

            // El carrusel principal
            Expanded(
              child: _construirCarruselFacil(),
            ),

            // Los puntitos de abajo
            _construirPuntitos(),

            // Botones grandes y claros
            _construirBotonesSimples(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _construirEncabezadoSimple() {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          // Logo o icono simple
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.directions_car,
              color: Colors.white,
              size: 40,
            ),
          ),

          const SizedBox(height: 15),

          // Nombre de la app bien grande
          Text(
            AppConstants.appName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          Text(
            'La app más fácil para tu carrito',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirCarruselFacil() {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      child: GestureDetector(
        onTapDown: (_) => _pararDeslizamientoAutomatico(),
        onTapUp: (_) => _reanudarDeslizamientoAutomatico(),
        onTapCancel: () => _reanudarDeslizamientoAutomatico(),
        child: PageView.builder(
          controller: _controladorPagina,
          onPageChanged: (indice) {
            setState(() {
              _paginaActual = indice;
            });
          },
          itemCount: _diapositivas.length,
          itemBuilder: (context, indice) {
            return _construirDiapositivaSimple(_diapositivas[indice]);
          },
        ),
      ),
    );
  }

  Widget _construirDiapositivaSimple(DiapositivaSimple diapositiva) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: diapositiva.color.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji grande y bonito
          Text(
            diapositiva.emoji,
            style: const TextStyle(fontSize: 80),
          ),

          const SizedBox(height: 30),

          // Título súper claro
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              diapositiva.titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: diapositiva.color,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Explicación fácil
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              diapositiva.subtitulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Detalles en palabras simples
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              diapositiva.descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirPuntitos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _diapositivas.length,
          (indice) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _paginaActual == indice ? 35 : 12,
            height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: _paginaActual == indice
                  ? _diapositivas[_paginaActual].color
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _construirBotonesSimples() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          // Botón principal - súper claro
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
                // Ir a registro
                print('¡Órale! ¡Vamos a registrarnos!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 8,
                shadowColor: Colors.red.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.thumb_up, size: 28),
                  SizedBox(width: 15),
                  Text(
                    '¡Órale! Quiero empezar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Botón para quien ya tiene cuenta
          SizedBox(
            width: double.infinity,
            height: 55,
            child: TextButton(
              onPressed: () {
                // Ir a login
                print('Ya tengo cuenta, vámonos al login');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Ya tengo mi cuenta',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 📱 Clase súper simple para las diapositivas
class DiapositivaSimple {
  final String titulo;
  final String subtitulo;
  final String descripcion;
  final String emoji;
  final Color color;

  DiapositivaSimple({
    required this.titulo,
    required this.subtitulo,
    required this.descripcion,
    required this.emoji,
    required this.color,
  });
}
