import 'dart:convert';

class CuisineModel {
  CuisineModel({required this.imageUrl, required this.cuisine});

  factory CuisineModel.fromRawJson(String str) =>
      CuisineModel.fromJson(json.decode(str));

  factory CuisineModel.fromJson(Map<String, dynamic> json) =>
      CuisineModel(imageUrl: json['imageUrl'], cuisine: json['cuisine']);

  String imageUrl;
  String cuisine;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {'imageUrl': imageUrl, 'cuisine': cuisine};

  /// Empty Helper Function
  static CuisineModel empty() => CuisineModel(imageUrl: '', cuisine: '');
}

// Our demo Special
List<CuisineModel> demoCuisines = [
  CuisineModel(imageUrl: 'assets/images/italian_food.png', cuisine: 'Italian'),
  CuisineModel(imageUrl: 'assets/images/mexican_food.jpg', cuisine: 'Mexican'),
  CuisineModel(imageUrl: 'assets/images/chinese_food.jpg', cuisine: 'Chinese'),
  CuisineModel(imageUrl: 'assets/images/indian_food.jpg', cuisine: 'Indian'),
  CuisineModel(imageUrl: 'assets/images/thai_food.jpg', cuisine: 'Thai'),
  CuisineModel(
    imageUrl: 'assets/images/american_food.jpg',
    cuisine: 'American',
  ),
  CuisineModel(
    imageUrl: 'assets/images/japanese_food.jpg',
    cuisine: 'Japanese',
  ),
];
