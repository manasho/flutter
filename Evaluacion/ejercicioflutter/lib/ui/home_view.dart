import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_view.dart';

class HomeView extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    await AuthService.removeToken();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
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
    );
  }
}