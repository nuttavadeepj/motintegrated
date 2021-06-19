import 'dart:convert';

class UserModel {
  final String address;
  final String email;
  final String name;
  final String phone;
  final String point;
  final String orderid;
  UserModel({
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.point,
    required this.orderid,
  });

 

  UserModel copyWith({
    String? address,
    String? email,
    String? name,
    String? phone,
    String? point,
    String? orderid,
  }) {
    return UserModel(
      address: address ?? this.address,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      point: point ?? this.point,
      orderid: orderid ?? this.orderid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'name': name,
      'phone': phone,
      'point': point,
      'orderid': orderid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: map['address'],
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      point: map['point'],
      orderid: map['orderid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(address: $address, email: $email, name: $name, phone: $phone, point: $point, orderid: $orderid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.address == address &&
      other.email == email &&
      other.name == name &&
      other.phone == phone &&
      other.point == point &&
      other.orderid == orderid;
  }

  @override
  int get hashCode {
    return address.hashCode ^
      email.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      point.hashCode ^
      orderid.hashCode;
  }
}
