// ignore_for_file: public_member_api_docs, sort_constructors_first
class MaterialModel {
  String? title;
  String? brand;
  String? price;
  String? originalPrice;
  num? rating;
  int? reviews;
  String? tag;
  String? image;
  int? qty;
  MaterialModel({
    this.title,
    this.brand,
    this.price,
    this.originalPrice,
    this.rating,
    this.reviews,
    this.tag,
    this.image,
    this.qty,
  });

  MaterialModel copyWith({
    String? title,
    String? brand,
    String? price,
    String? originalPrice,
    num? rating,
    int? reviews,
    String? tag,
    String? image,
    int? qty,
  }) {
    return MaterialModel(
      title: title ?? this.title,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      tag: tag ?? this.tag,
      image: image ?? this.image,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'brand': brand,
      'price': price,
      'originalPrice': originalPrice,
      'rating': rating,
      'reviews': reviews,
      'tag': tag,
      'image': image,
      'qty': qty,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      title: map['title'] != null ? map['title'] as String : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      originalPrice: map['originalPrice'] != null
          ? map['originalPrice'] as String
          : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      reviews: map['reviews'] != null ? map['reviews'] as int : null,
      tag: map['tag'] != null ? map['tag'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
    );
  }

  num get amountToNum {
    return num.parse(price?.replaceAll('\$', '') ?? '0');
  }
}
