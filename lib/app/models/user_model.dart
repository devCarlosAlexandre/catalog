import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? email;
  bool? is_admin;
  DateTime? created_at;
  String? token;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.is_admin,
    this.created_at,
    this.token,
  });

  get password => null;

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    bool? is_admin,
    DateTime? created_at,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      is_admin: is_admin ?? this.is_admin,
      created_at: created_at ?? this.created_at,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'is_admin': is_admin,
      'created_at': created_at?.millisecondsSinceEpoch,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
      is_admin: map['is_admin'],
      created_at:
          map['created_at'] != null ? DateTime.tryParse(map['created_at']) : null,
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, is_admin: $is_admin, created_at: $created_at, token: $token)';
  }

  static List<UserModel> fromList(list) {
    return List<UserModel>.from(list.map((x) => UserModel.fromMap(x)));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.is_admin == is_admin &&
        other.created_at == created_at &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        is_admin.hashCode ^
        created_at.hashCode ^
        token.hashCode;
  }
}