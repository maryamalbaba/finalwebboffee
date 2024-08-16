// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/bookinner.dart';
import 'package:bofweb/core/Model/user.dart';

class report  extends ResultModel{
 String body;
 User user;
book_inner_report book;
  report({
    required this.body,
    required this.user,
    required this.book,
  });



  report copyWith({
    String? body,
    User? user,
    book_inner_report? book,
  }) {
    return report(
      body: body ?? this.body,
      user: user ?? this.user,
      book: book ?? this.book,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'user': user.toMap(),
      'book': book.toMap(),
    };
  }

  factory report.fromMap(Map<String, dynamic> map) {
    return report(
      body: map['body'] as String,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      book: book_inner_report.fromMap(map['book'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory report.fromJson(String source) => report.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'report(body: $body, user: $user, book: $book)';

  @override
  bool operator ==(covariant report other) {
    if (identical(this, other)) return true;
  
    return 
      other.body == body &&
      other.user == user &&
      other.book == book;
  }

  @override
  int get hashCode => body.hashCode ^ user.hashCode ^ book.hashCode;
}
