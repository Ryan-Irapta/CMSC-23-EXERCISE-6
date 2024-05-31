import 'package:exer6/model/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/MyCart.dart';
import 'screen/MyCatalog.dart';
import 'screen/Checkout.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingCart(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/products',
        routes: {
          '/products': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
          '/checkout': (context) {
            final List<Item> cartItems = ModalRoute.of(context)!.settings.arguments as List<Item>;
            return Checkout(cartItems: cartItems);
          },
        },
      ),
    );
  }
}
