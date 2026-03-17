import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Para emulador Android (equivale a localhost en host machine)
  static const String baseUrl = 'http://10.0.2.2:3000';
  // Para iOS/web/dispositivo físico usa la IP de la máquina o URL pública.
  // static const String baseUrl = 'http://localhost:3000';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final endpoint = '$baseUrl/api_v1/apiUserLogin';
    final bodyMap = {
      'usernameOrEmail': email,
      'username': email,
      'email': email,
      'password': password,
    };

    print('LOGIN endpoint: $endpoint');
    print('LOGIN body: $bodyMap');

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(bodyMap),
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
        'nombre_rol': name,
        'descripcion': description,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al crear rol: ${response.statusCode} ${response.body}');
    }
  }
}