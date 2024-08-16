// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class book_inner_report {
  String title;
  book_inner_report({
    required this.title,
  });

  book_inner_report copyWith({
    String? title,
  }) {
    return book_inner_report(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  factory book_inner_report.fromMap(Map<String, dynamic> map) {
    return book_inner_report(
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory book_inner_report.fromJson(String source) => book_inner_report.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'book_inner_report(title: $title)';

  @override
  bool operator ==(covariant book_inner_report other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
