import 'dart:convert';

import 'package:http/http.dart' as http;

class RestaurantsRepository {
  final String apiKey = 'AIzaSyAvY494C6LyYvwqzmHUFCYcG0otVfpAMiw';

  Future<List<dynamic>> getNearbyRestaurants(double lat, double lng) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=1500&type=restaurant&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Error obteniendo restaurantes');
    }
  }

  String getPhotoUrl(String? photoReference) {
    if (photoReference == null) {
      return 'https://via.placeholder.com/100'; // Imagen de respaldo si no hay foto
    }
    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoReference&key=$apiKey';
  }
}
