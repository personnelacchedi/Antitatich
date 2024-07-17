import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Votre panier'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return CartItemTile(item: item);
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totale',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${cart.totalPrice.toStringAsFixed(2)} TND',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Proceed to checkout
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Passer à la caisse',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final CartItem item;

  CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/image9.png', // Replace with your image path
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${item.price.toStringAsFixed(2)} TND/piece',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  '${(item.price * item.quantity).toStringAsFixed(2)} TND',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () {
              if (item.quantity > 1) {
                cart.updateItemQuantity(item, item.quantity - 1);
              } else {
                cart.removeItem(item);
              }
            },
          ),
          Text(
            '${item.quantity}',
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.green),
            onPressed: () {
              cart.updateItemQuantity(item, item.quantity + 1);
            },
          ),
        ],
      ),
    );
  }
}
