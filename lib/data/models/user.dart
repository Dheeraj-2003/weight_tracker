import 'dart:convert';

class User {
  final String name;

  User({
    required this.name,
  });

  User copyWith({
    String? name,
  }) {
    return User(
      name: name ?? this.name,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'name': name,
    };
  }

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'User(name: $name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
