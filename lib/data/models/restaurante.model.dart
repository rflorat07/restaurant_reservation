class RestaurantModel {
  RestaurantModel({
    required this.placeId,
    required this.name,
    required this.rating,
    required this.userRatingsTotal,
    required this.vicinity,
    required this.geometry,
    this.photos = const [],
    this.openingHours = const OpeningHours(),
    required this.icon,
    this.businessStatus = '',
    this.priceLevel,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      placeId: json['place_id'],
      name: json['name'],
      rating: json['rating']?.toDouble() ?? 0.0,
      userRatingsTotal: json['user_ratings_total'] ?? 0,
      vicinity: json['vicinity'],
      geometry: Geometry.fromJson(json['geometry']),
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map((photo) => Photo.fromJson(photo))
              .toList() ??
          [],
      openingHours:
          json['opening_hours'] != null
              ? OpeningHours.fromJson(json['opening_hours'])
              : const OpeningHours(),
      icon: json['icon'],
      businessStatus: json['business_status'] ?? '',
      priceLevel: json['price_level'],
    );
  }
  final String placeId;
  final String name;
  final double rating;
  final int userRatingsTotal;
  final String vicinity;
  final Geometry geometry;
  final List<Photo> photos;
  final OpeningHours openingHours;
  final String icon;
  final String businessStatus;
  final int? priceLevel;

  String getPriceLevelString() {
    if (priceLevel == null) {
      return 'No disponible';
    }
    switch (priceLevel) {
      case 0:
        return 'Gratis';
      case 1:
        return 'Económico';
      case 2:
        return 'Moderado';
      case 3:
        return 'Caro';
      case 4:
        return 'Muy caro';
      default:
        return 'Precio desconocido';
    }
  }
}

class Geometry {
  Geometry({required this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(location: Location.fromJson(json['location']));
  }
  final Location location;
}

class Location {
  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat'], lng: json['lng']);
  }
  final double lat;
  final double lng;
}

class Photo {
  Photo({
    required this.photoReference,
    required this.height,
    required this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      photoReference: getPhotoUrl(json['photo_reference']),
      height: json['height'],
      width: json['width'],
    );
  }
  final String photoReference;
  final int height;
  final int width;
}

String getPhotoUrl(String? photoReference) {
  if (photoReference == null) {
    return 'https://via.placeholder.com/100'; // Imagen de respaldo si no hay foto
  }
  return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoReference&key=AIzaSyAvY494C6LyYvwqzmHUFCYcG0otVfpAMiw';
}

class OpeningHours {
  const OpeningHours({this.openNow = false});

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(openNow: json['open_now'] ?? false);
  }
  final bool openNow;
}
