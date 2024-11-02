import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  final String _apiKey = 'f0fbc0fa'; // Replace with your OMDb API key

  Future<List<Movie>> fetchMovies() async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=$_apiKey&s=Marvel&type=movie');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List moviesJson = json.decode(response.body)['Search'];
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
