import 'package:flutter/material.dart';
import 'item_detail_screen.dart';
import 'item_card.dart';


class AllProductsScreen extends StatelessWidget {
  final List<ItemCard> items;

  AllProductsScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tous les produits',style: TextStyle( fontFamily: 'Montserrat'),),

      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}

