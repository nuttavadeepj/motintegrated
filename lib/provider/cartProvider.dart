import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  String? token = null;

  List<String>? items = [];
  List<String>? items2 = [];
  List<String>? items3 = [];
  CartProvider(this.token, this.items, this.items2, this.items3);
  Future<void> fetchItem() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    
    items = pref.getStringList('cart');
    items2 = pref.getStringList('cart2');
    items3 = pref.getStringList('cart3');

    if (items == null) {
      items = [];
    }
    if (items2 == null) {
      items2 = [];
    }
    if (items3 == null) {
      items3 = [];
    }

    print(items);
    print(items2);
    print(items3);
  }

  Future<void> addItemToCart(String pic) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items?.add(pic);
    pref.setStringList('cart', items!);
    // await pref.clear();
  }

  Future<void> addNameToCart(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items2?.add(name);
    pref.setStringList('cart2', items2!);
    // await pref.clear();
  }

  Future<void> addPriceToCart(String price) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items3?.add(price);
    pref.setStringList('cart3', items3!);
    
    // await pref.clear();
  }

  Future<void> removeFromCart(String pic, String name, String price) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items?.remove(pic);
    items2?.remove(name);
    items3?.remove(price);
    pref.setStringList('cart', items!);
    pref.setStringList('cart2', items2!);
    pref.setStringList('cart3', items3!);
    print(items);
    print(items2);
    print(items3);
  }

  Future<void> removeAllFromCart() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    await pref.clear();
    print(items);
    print(items2);
    print(items3);
    await fetchItem();
  }

  // Future<void> sumOfProducts() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await fetchItem();
  //   var sum = 0;
    
  //   for (var i = 0; i < items!.length; i++) {
  //     if(items3.toString() == '30'){
  //       sum += 30;
  //     }else if(items3.toString() == '300'){
  //       sum += 300;
  //     }else if(items3.toString()  == '500'){
  //       sum += 500;
  //     }else if(items3.toString()  == '1000'){
  //       sum += 1000;
  //     }
  //   }
  //   print("Sum : ${sum}");
  // }
}
