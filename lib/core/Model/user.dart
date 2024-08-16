// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {

 String user_name;
  User({
    required this.user_name,
  });


  User copyWith({
    String? user_name,
  }) {
    return User(
      user_name: user_name ?? this.user_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': user_name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      user_name: map['user_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(user_name: $user_name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.user_name == user_name;
  }

  @override
  int get hashCode => user_name.hashCode;
}
