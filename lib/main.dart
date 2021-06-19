import 'package:flutter/material.dart';
import 'package:motintegrated/screens/welcome.dart';
import 'package:provider/provider.dart';
import 'package:motintegrated/provider/authProvider.dart';
import 'package:motintegrated/provider/cartProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(null),
          ),
          ChangeNotifierProxyProvider<AuthProvider, CartProvider>(
              create: (_) => CartProvider(null, [], [], []),
              update: (ctx, auth, cart) =>
                  CartProvider(auth.token, cart!.items, cart.items2, cart.items3)),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MOT',
            theme: ThemeData(fontFamily: 'Jost'),
            home: Welcome()));
  }
}
