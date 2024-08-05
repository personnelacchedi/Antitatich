// item_card.dart
import 'package:flutter/material.dart';
import 'item_detail_screen.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double oldPrice;
  final double newPrice;
  final String distance;
  final double rating;
  final String discount;
  final String description;
  final int availablePieces;
  final String storeName;
  final bool deliveryAvailable;

  ItemCard({
    required this.imageUrl,
    required this.name,
    required this.oldPrice,
    required this.newPrice,
    required this.distance,
    required this.rating,
    required this.discount,
    required this.description,
    required this.availablePieces,
    required this.storeName,
    required this.deliveryAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              imageUrl: imageUrl,
              name: name,
              description: description,
              oldPrice: oldPrice,
              newPrice: newPrice,
              distance: distance,
              rating: rating,
              discount: discount,
              availablePieces: availablePieces,
              storeName: storeName,
              deliveryAvailable: deliveryAvailable,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 164,
          height: 134,

          decoration: BoxDecoration(
            color: Colors.white,  // Explicit color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                offset: Offset(-2, 3),
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        discount,
                        style: TextStyle(
                          fontFamily: 'RobotoSlab-Regular',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        distance,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'RobotoSlab-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '$rating',
                              style: TextStyle(
                                fontFamily: 'RobotoSlab-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '$oldPrice TND',
                          style: TextStyle(
                            fontFamily: 'RobotoSlab-Regular',
                            fontSize: 17,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(152, 203, 81, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$newPrice TND',
                            style: TextStyle(
                              fontFamily: 'RobotoSlab-Bold',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
