// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bofweb/core/Model/basic_model.dart';

class suggestionModel extends ResultModel {
  String user_name;
  String body;
  String author_name;
  suggestionModel({
    required this.user_name,
    required this.body,
    required this.author_name,
  });
  

  suggestionModel copyWith({
    String? user_name,
    String? body,
    String? author_name,
  }) {
    return suggestionModel(
      user_name: user_name ?? this.user_name,
      body: body ?? this.body,
      author_name: author_name ?? this.author_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': user_name,
      'body': body,
      'author_name': author_name,
    };
  }

  factory suggestionModel.fromMap(Map<String, dynamic> map) {
    return suggestionModel(
      user_name: map['user_name'] as String,
      body: map['body'] as String,
      author_name: map['author_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory suggestionModel.fromJson(String source) => suggestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'suggestionModel(user_name: $user_name, body: $body, author_name: $author_name)';

  @override
  bool operator ==(covariant suggestionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.user_name == user_name &&
      other.body == body &&
      other.author_name == author_name;
  }

  @override
  int get hashCode => user_name.hashCode ^ body.hashCode ^ author_name.hashCode;
}
