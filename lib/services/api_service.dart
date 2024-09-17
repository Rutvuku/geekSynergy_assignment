import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List> fetchMovies() async {
    var url = Uri.parse('https://hoblist.com/api/movieList');
    var response = await http.post(
      url,
      body: {
        'category': 'movies',
        'language': 'kannada',
        'genre': 'all',
        'sort': 'voting'
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['result'];  // Assuming 'result' is the key where movie list is stored
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
