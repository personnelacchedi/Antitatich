import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class ItemDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double oldPrice;
  final double newPrice;
  final String distance;
  final double rating;
  final String discount;
  final int availablePieces;
  final String storeName;
  final bool deliveryAvailable;

  ItemDetailScreen({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.oldPrice,
    required this.newPrice,
    required this.distance,
    required this.rating,
    required this.discount,
    required this.availablePieces,
    required this.storeName,
    required this.deliveryAvailable,
  });

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '\$$oldPrice',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '\$$newPrice',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Text(
                  '$rating',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.location_pin, color: Colors.green),
                SizedBox(width: 5),
                Text(
                  distance,
                  style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.store, color: Colors.orange),
                SizedBox(width: 5),
                Text(
                  'Chez $storeName',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.delivery_dining, color: deliveryAvailable ? Colors.green : Colors.red),
                SizedBox(width: 5),
                Text(
                  deliveryAvailable ? 'Livraison disponible' : 'Livraison non disponible',
                  style: TextStyle(fontSize: 16, color: deliveryAvailable ? Colors.green : Colors.red),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '$availablePieces Pièces disponibles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                cart.addItem(name, newPrice, 1);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.shopping_cart),
              label: Text('Ajouter au panier'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
