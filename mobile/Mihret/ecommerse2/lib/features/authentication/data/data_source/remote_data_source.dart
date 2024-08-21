import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/user_model.dart';

abstract class RemoteDataSource{
  Future<UserModel> logIn(String email, String password);  
  Future<UserModel> logOut();
  Future<UserModel> signUp(String username, String password, String email);
}


class RemoteDataSourceImpl extends RemoteDataSource{

  final client = http.Client();
  
  @override
  Future<UserModel> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(String username, String password, String email) async {

    final response = await client.post(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register'),
      body: {
        'username': username,
        'password': password,
        'email': email,
      },
    );

    if (response.statusCode == 201) {
      final jsonData = json.encode(response.body) as Map<String, dynamic>;
      final jsonFinal = jsonData['data'];
      return UserModel.fromJson(jsonFinal);      

    } else {
      throw Exception('Failed to load user');
    }
    
  }
  


  @override
  Future<UserModel> logIn(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      final jsonData = json.encode(response.body) as Map<String, dynamic>;
      final accessToken =  jsonData['data']['accessToken'];
      final newURL = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me');
      final response_2 = await client.get(newURL, headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-type': 'application/json',
      });
      if (response_2.statusCode != 200) {
        throw Exception('Failed to load user');
      }
      final jsonFinal = json.encode(response_2.body) as Map<String, dynamic>;

      return UserModel.fromJson(jsonFinal['data']);

    } else {
      throw Exception('Failed to load user');
    }
  }
}