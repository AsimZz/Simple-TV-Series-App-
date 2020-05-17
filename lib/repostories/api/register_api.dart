import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final apiUrl = 'http://localhost:4000/user/signup';

class RegisterAPI {
  Future<String> createNewUser() async {
    String fullURL = apiUrl;

    final response = await http.post(fullURL, body: {
      "username": "Asoome",
      "email": "asomebayad123@gmail.com",
      "password": "asimz999",
      "confirmPassword": "asimz999"
    });
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    }
  }
}
