import 'dart:convert';

List<Image> categoryFromJson(String str) => List<Image>.from(json.decode(str).map((x) => Image.fromJson(x)));
String categoryToJson(List<Image> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Image {
  String? image;

  Image({this.image});

  Image.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}