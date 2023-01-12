import 'dart:convert';
import 'package:laborator_5/models/category_model.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Category? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  int? price;
  String? mainImage;
  int? id;

  Product(
      {this.category,
        this.name,
        this.details,
        this.size,
        this.colour,
        this.price,
        this.mainImage,
        this.id});

  Product.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    mainImage = json['main_image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['name'] = name;
    data['details'] = details;
    data['size'] = size;
    data['colour'] = colour;
    data['price'] = price;
    data['main_image'] = mainImage;
    data['id'] = id;
    return data;
  }
}