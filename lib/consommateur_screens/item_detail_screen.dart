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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.5,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.4,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(152, 203, 81, 1),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          '\$$newPrice',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Garnitures',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.inventory_2_outlined, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(
                        '$availablePieces Pièces disponibles',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.storefront_outlined, color: Colors.orange),
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
                      Icon(Icons.delivery_dining_sharp, color: deliveryAvailable ? Colors.green : Colors.red),
                      SizedBox(width: 5),
                      Text(
                        deliveryAvailable ? 'Livraison disponible' : 'Livraison non disponible',
                        style: TextStyle(
                          fontSize: 16,
                          color: deliveryAvailable ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      cart.addItem(name, newPrice, 1);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 25),
                    label: Text(
                      'Ajouter au panier',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(152, 203, 81, 1),
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
