import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartProvider with ChangeNotifier{
  String? token = null;
  List <String>? items = [];
  List <String>? items2 = [];
  List <String>? items3 = [];
  CartProvider(this.token,this.items,this.items2,this.items3);
  Future<void> fetchItem() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    // SharedPreferences pref2 = await SharedPreferences.getInstance();
    // SharedPreferences pref3 = await SharedPreferences.getInstance();
    items = pref.getStringList('cart');
    items2 = pref.getStringList('cart2');
    items3 = pref.getStringList('cart3');
    if(items == null){
      // if(items2 == null){
      //   if(items3 == null){
      items = [];
     
    }
    if(items2 == null){
      // if(items2 == null){
      //   if(items3 == null){
      
      items2 = [];
      
    }
    if(items3 == null){
      // if(items2 == null){
      //   if(items3 == null){
     
      items3 = [];
    }
    //}} 
    print(items);
    print(items2);
    print(items3);
  }
  Future<void> addItemToCart(String id) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items?.add(id);
    pref.setStringList('cart', items!);
    
  }
  Future<void> addNameToCart(String name) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items2?.add(name);
    pref.setStringList('cart2', items2!);
    
  }
  Future<void> addPriceToCart(String price) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await fetchItem();
    items3?.add(price);
    pref.setStringList('cart3', items3!);
    
  }
}