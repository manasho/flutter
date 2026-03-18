
import 'package:flutter/material.dart';

import 'login_view.dart';

class HomeView extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Evita que se pueda retroceder con el botón físico
      onPopInvoked: (didPop) async {
        // Este método se llama cuando se intenta retroceder
        // Si didPop es true, ya se realizó la navegación
        if (!didPop) {
          // Aquí puedes mostrar un diálogo de confirmación o simplemente no hacer nada
          // Por ejemplo, mostrar un mensaje:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Usa el botón de salida para cerrar sesión')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
          automaticallyImplyLeading: false, // Elimina la flecha de retroceso
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        body: Center(
          child: Text('¡Bienvenido a la app!'),
        ),
      ),
    );
  }
}
