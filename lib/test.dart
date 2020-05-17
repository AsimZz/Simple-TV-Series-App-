import 'package:flutter/material.dart';
import 'package:tv_series/repostories/api/register_api.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  TestApi({Key key}) : super(key: key);

  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  Future<String> createNewUser() async {
    final apiUrl = 'http://127.0.0.1:4000/user/signup';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Container(
        child: FutureBuilder(
            future: createNewUser(),
            builder: (context, snapshot) {
              if (snapshot == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: Text(snapshot.data),
              );
            }),
      ),
    );
  }
}
