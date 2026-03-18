import 'dart:convert'; // <-- Esta es la que falta
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiService {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:3000';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else {
      return 'http://192.168.1.x:3000'; // Cambia por tu IP real
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final endpoint = '$baseUrl/api_v1/apiUserLogin';
    final bodyMap = {
      'api_user': email,
      'api_password': password,
    };

    print('LOGIN endpoint: $endpoint');
    print('LOGIN body: $bodyMap');

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(bodyMap), // Aquí se usa jsonEncode
    );

    print('LOGIN status: ${response.statusCode}');
    print('LOGIN response: ${response.body}');

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        if (decoded.containsKey('error')) {
          throw Exception('Login falló: ${decoded['error']}');
        }
        return decoded;
      }
      return {'data': decoded};
    } else {
      throw Exception('Credenciales inválidas: ${response.statusCode} ${response.body}');
    }
  }

  Future<Map<String, dynamic>> createRole(String name, String? description, String token) async {
    final endpoint = '$baseUrl/api_v1/role';

    print('CREATE ROLE endpoint: $endpoint');
    print('CREATE ROLE body: {nombre_rol: $name, descripcion: $description}');

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
     body: jsonEncode({
        'name': name,                // antes 'nombre_rol'
       'description': description,  // antes 'descripcion'
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al crear rol: ${response.statusCode} ${response.body}');
    }
  }
}