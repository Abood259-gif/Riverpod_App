

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsive_app/model/usermodel.dart';

class AuthRepository {
  static const String _baseUrl = 'https://api.escuelajs.co/api/v1';

  Future<bool> checkEmailAvailability(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/users/is-available'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['isAvailable'] as bool; 
    } else {
      throw Exception('فشل في فحص البريد الإلكتروني');
    }
  }


  Future<UserModel> createUser({
    required String name,
    required String email,
    required String password,
    String avatar = 'https://picsum.photos/800',
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/users/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatar,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('فشل في إنشاء الحساب، يرجى التأكد من البيانات');
    }
  }


  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final token = data['access_token'];

      final profileResponse = await http.get(
        Uri.parse('$_baseUrl/auth/profile'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (profileResponse.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(profileResponse.body));
      }
    }
    throw Exception('البريد الإلكتروني أو كلمة السر غير صحيحة');
  }
}