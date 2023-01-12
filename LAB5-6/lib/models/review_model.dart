import 'dart:convert';

List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));
String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  int? id;
  String? modifiedAt;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? image;
  int? rating;
  String? message;

  Review(
      {this.id,
        this.modifiedAt,
        this.createdAt,
        this.firstName,
        this.lastName,
        this.image,
        this.rating,
        this.message});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modifiedAt = json['modified_at'];
    createdAt = json['created_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    rating = json['rating'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['modified_at'] = modifiedAt;
    data['created_at'] = createdAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['rating'] = rating;
    data['message'] = message;
    return data;
  }
}