import 'package:dio/dio.dart';

class ApiService {
  // L'URL de ton Backend Laravel (Port 80)
  // Vérifie bien que l'adresse finit par -80.app.github.dev
  static const String baseUrl = "https://automatic-enigma-q7rp9r7vgqr7h6xwj-80.app.github.dev/api";
  
  final Dio _dio = Dio();

  Future<String?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        "$baseUrl/login",
        data: {
          'email': email,
          'password': password,
          'device_name': 'mobile_app',
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Renvoie le token si la connexion réussit
        return response.data['token'];
      }
    } on DioException catch (e) {
      print("Erreur API : ${e.response?.data ?? e.message}");
    }
    return null;
  }
}