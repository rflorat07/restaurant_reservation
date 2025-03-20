import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class RestaurantsRepository {
  final String apiKey = 'AIzaSyAvY494C6LyYvwqzmHUFCYcG0otVfpAMiw';

  Future<List<RestaurantModel>> getNearbyRestaurants(
    double lat,
    double lng,
  ) async {
    try {
      final String url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=1500&type=restaurant&key=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData['results'];
        return results
            .map((restaurants) => RestaurantModel.fromJson(restaurants))
            .toList();
      } else {
        throw Exception('Error obteniendo restaurantes');
      }
    } catch (e) {
      return []; // Devuelve una lista vacía en caso de error
    }
  }

  String getPhotoUrl(String? photoReference) {
    if (photoReference == null) {
      return 'https://via.placeholder.com/100'; // Imagen de respaldo si no hay foto
    }
    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoReference&key=$apiKey';
  }
}
