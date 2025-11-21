// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubjectModel {
  String? subject;
  String? icon;
  String? mainColor;
  String? gradientColor;
  SubjectModel({this.subject, this.icon, this.mainColor, this.gradientColor});

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      subject: map['subject'] != null ? map['subject'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      mainColor: map['main-color'] != null ? map['main-color'] as String : null,
      gradientColor: map['gradient-color'] != null
          ? map['gradient-color'] as String
          : null,
    );
  }

  SubjectModel copyWith({
    String? subject,
    String? icon,
    String? mainColor,
    String? gradientColor,
  }) {
    return SubjectModel(
      subject: subject ?? this.subject,
      icon: icon ?? this.icon,
      mainColor: mainColor ?? this.mainColor,
      gradientColor: gradientColor ?? this.gradientColor,
    );
  }
}
