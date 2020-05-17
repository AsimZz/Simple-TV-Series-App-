import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final String apiKey = '3dea7c8e2dc24cbe8d847a907db2c098';

final apiUrl = 'https://api.themoviedb.org/3/tv/';

class TvDetailsAPI {
  Future<String> getTvDetails(String tvId) async {
    String fullURL = apiUrl + tvId + '?api_key=' + apiKey;

    final response = await http.get(fullURL);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    }
  }
}
