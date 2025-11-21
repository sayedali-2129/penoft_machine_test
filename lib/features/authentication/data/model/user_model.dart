// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int? id;
  final String? fullname;
  final String? email;
  final String? phone;
  final String? picture;
  UserModel({this.id, this.fullname, this.email, this.phone, this.picture});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'picture': picture,
    };
  }

  Map<String, dynamic> toCreateUserMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'picture': picture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
    );
  }

  UserModel copyWith({
    int? id,
    String? fullname,
    String? email,
    String? phone,
    String? picture,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      picture: picture ?? this.picture,
    );
  }
}
