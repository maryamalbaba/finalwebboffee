// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bofweb/core/Model/basic_model.dart';

class UserModel extends ResultModel {
String title;
String user_name;
String level;
num books;
  UserModel({
    required this.title,
    required this.user_name,
    required this.level,
    required this.books,
  });

  UserModel copyWith({
    String? title,
    String? user_name,
    String? level,
    num? books,
  }) {
    return UserModel(
      title: title ?? this.title,
      user_name: user_name ?? this.user_name,
      level: level ?? this.level,
      books: books ?? this.books,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'user_name': user_name,
      'level': level,
      'books': books,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      title: map['title'] as String,
      user_name: map['user_name'] as String,
      level: map['level'] as String,
      books: map['books'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(title: $title, user_name: $user_name, level: $level, books: $books)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.user_name == user_name &&
      other.level == level &&
      other.books == books;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      user_name.hashCode ^
      level.hashCode ^
      books.hashCode;
  }
}
