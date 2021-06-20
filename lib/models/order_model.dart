import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class OrderModel {
  final String orderid;
  List<String> product;
  final String trackno;
  final int? price;
  final String userid;
  final FieldValue date;
  OrderModel({
    required this.orderid,
    required this.product,
    required this.trackno,
    this.price,
    required this.userid,
    required this.date,
  });
  

  OrderModel copyWith({
    String? orderid,
    List<String>? product,
    String? trackno,
    int? price,
    String? userid,
    FieldValue? date,
  }) {
    return OrderModel(
      orderid: orderid ?? this.orderid,
      product: product ?? this.product,
      trackno: trackno ?? this.trackno,
      price: price ?? this.price,
      userid: userid ?? this.userid,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderid': orderid,
      'product': product,
      'trackno': trackno,
      'price': price,
      'userid': userid,
      'date': date,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderid: map['orderid'],
      product: List<String>.from(map['product']),
      trackno: map['trackno'],
      price: map['price'],
      userid: map['userid'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(orderid: $orderid, product: $product, trackno: $trackno, price: $price, userid: $userid, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderModel &&
      other.orderid == orderid &&
      listEquals(other.product, product) &&
      other.trackno == trackno &&
      other.price == price &&
      other.userid == userid &&
      other.date == date;
  }

  @override
  int get hashCode {
    return orderid.hashCode ^
      product.hashCode ^
      trackno.hashCode ^
      price.hashCode ^
      userid.hashCode ^
      date.hashCode;
  }
}
