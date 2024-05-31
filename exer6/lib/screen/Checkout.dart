import 'package:exer6/provider/shoppingcart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Item.dart';

class Checkout extends StatelessWidget {
  final List<Item> cartItems;

  const Checkout({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Items in Cart:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index].name),
                    subtitle: Text('Price: ${cartItems[index].price.toStringAsFixed(2)}'), // Remove the currency sign
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ShoppingCart>().checkout();

                // Show payment successful prompt
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Payment Successful"),
                    duration: Duration(seconds: 2),
                  ),
                );
                
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
