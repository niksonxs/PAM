import 'dart:convert';
import 'package:laborator_5/models/category_model.dart';
import 'package:laborator_5/models/image_model.dart';
import 'package:laborator_5/models/review_model.dart';

List<ProductDetail> productFromJson(String str) => List<ProductDetail>.from(json.decode(str).map((x) => ProductDetail.fromJson(x)));
String productToJson(List<ProductDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetail{
  Category? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  int? price;
  int? id;
  String? mainImage;
  List<Image>? images;
  List<Review>? reviews;

  ProductDetail(
      {this.category,
        this.name,
        this.details,
        this.size,
        this.colour,
        this.price,
        this.id,
        this.mainImage,
        this.images,
        this.reviews});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    id = json['id'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = <Image>[];
      json['images'].forEach((image) {
        images!.add(Image.fromJson(image));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((review) {
        reviews!.add(Review.fromJson(review));
      });
    }
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
    data['id'] = id;
    data['main_image'] = mainImage;
    if (images != null) {
      data['images'] = images!.map((image) => image.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((review) => review.toJson()).toList();
    }
    return data;
  }
}