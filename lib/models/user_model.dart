import 'dart:convert';

class UserModel {
  final String address;
  final String email;
  final String name;
  final String phone;
  final String point;
  UserModel({
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.point,
  });
  

  UserModel copyWith({
    String? address,
    String? email,
    String? name,
    String? phone,
    String? point,
  }) {
    return UserModel(
      address: address ?? this.address,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      point: point ?? this.point,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'name': name,
      'phone': phone,
      'point': point,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: map['address'],
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      point: map['point'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(address: $address, email: $email, name: $name, phone: $phone, point: $point)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.address == address &&
      other.email == email &&
      other.name == name &&
      other.phone == phone &&
      other.point == point;
  }

  @override
  int get hashCode {
    return address.hashCode ^
      email.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      point.hashCode;
  }
}
