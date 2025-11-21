import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String? title;
  String? author;
  String? duration;
  String? price;
  String? originalPrice;
  num? rating;
  int? reviews;
  String? tag;
  String? image;
  CourseModel({
    this.title,
    this.author,
    this.duration,
    this.price,
    this.originalPrice,
    this.rating,
    this.reviews,
    this.tag,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'duration': duration,
      'price': price,
      'originalPrice': originalPrice,
      'rating': rating,
      'reviews': reviews,
      'tag': tag,
      'image': image,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      title: map['title'] != null ? map['title'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      originalPrice: map['originalPrice'] != null
          ? map['originalPrice'] as String
          : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      reviews: map['reviews'] != null ? map['reviews'] as int : null,
      tag: map['tag'] != null ? map['tag'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CourseModel copyWith({
    String? title,
    String? author,
    String? duration,
    String? price,
    String? originalPrice,
    num? rating,
    int? reviews,
    String? tag,
    String? image,
  }) {
    return CourseModel(
      title: title ?? this.title,
      author: author ?? this.author,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      tag: tag ?? this.tag,
      image: image ?? this.image,
    );
  }
}
