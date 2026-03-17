import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/error_message.dart';

class CreateRoleView extends StatefulWidget {
  @override
  _CreateRoleViewState createState() => _CreateRoleViewState();
}

class _CreateRoleViewState extends State<CreateRoleView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  final ApiService _api = ApiService();

  Future<void> _createRole() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      final token = await AuthService.getToken();
      if (token == null) {
        setState(() {
          _message = 'Debes iniciar sesión primero';
        });
        return;
      }

      await _api.createRole(
        _nameController.text,
        _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
        token,
      );

      setState(() {
        _message = 'Rol creado exitosamente';
      });
      _nameController.clear();
      _descriptionController.clear();
    } catch (e) {
      setState(() {
        _message = 'Error al crear rol: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear nuevo rol')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Nombre del rol',
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: _descriptionController,
                label: 'Descripción (opcional)',
                maxLines: 3,
              ),
              SizedBox(height: 16),
              if (_message != null) ErrorMessage(message: _message!),
              SizedBox(height: 24),
              CustomButton(
                text: 'Guardar rol',
                onPressed: _createRole,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}