import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartProvider with ChangeNotifier{
  String? token = null;
  List <String>? items = [];
  CartProvider(this.token,this.items);
  Future<void> fetchItem() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    items = pref.getStringList('cart');
    if(items == null){
      items = [];
    }
    print(items);
  }
  Future<void> addItemToCart(String id) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items?.add(id);
    pref.setStringList('cart', items!);
  }
}