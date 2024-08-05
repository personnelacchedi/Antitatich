import 'package:flutter/material.dart';
import 'item_card.dart';
import 'all_products_screen.dart';
import 'filter_screen.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  String searchTerm = '';
  double minPrice = 0;
  double maxPrice = 100;
  double minDistance = 0;
  double maxDistance = 50;

  @override
  Widget build(BuildContext context) {
    // Example items for each category
    List<ItemCard> allProductsItems = [
      ItemCard(
        imageUrl: 'assets/images/image9.png',
        name: 'Item 1',
        oldPrice: 50,
        newPrice: 45,
        distance: '5 km',
        rating: 4.5,
        discount: '10%',
        description: 'Description of Item 1',
        availablePieces: 10,
        storeName: 'Store 1',
        deliveryAvailable: true,
      ),
      // Add more items as needed
    ];

    List<ItemCard> fruitsAndVeggiesItems = [
      ItemCard(
        imageUrl: 'assets/images/image9.png',
        name: 'Fruit 1',
        oldPrice: 30,
        newPrice: 25,
        distance: '2 km',
        rating: 4.8,
        discount: '17%',
        description: 'Description of Fruit 1',
        availablePieces: 5,
        storeName: 'Store 3',
        deliveryAvailable: false,
      ),
      // Add more items as needed
    ];

    List<ItemCard> foodItems = [
      ItemCard(
        imageUrl: 'assets/images/image9.png',
        name: 'Food 1',
        oldPrice: 60,
        newPrice: 55,
        distance: '10 km',
        rating: 4.0,
        discount: '8%',
        description: 'Description of Food 1',
        availablePieces: 8,
        storeName: 'Store 2',
        deliveryAvailable: true,
      ),
      // Add more items as needed
    ];

    // Filter items based on search term and other filters
    List<ItemCard> filteredAllProductsItems = allProductsItems.where((item) {
      double itemPrice = item.newPrice;
      double itemDistance = double.parse(item.distance.split(' ')[0]);
      bool matchesSearchTerm = item.name.toLowerCase().contains(searchTerm.toLowerCase());
      return itemPrice >= minPrice &&
          itemPrice <= maxPrice &&
          itemDistance >= minDistance &&
          itemDistance <= maxDistance &&
          matchesSearchTerm;
    }).toList();

    List<ItemCard> filteredFruitsAndVeggiesItems = fruitsAndVeggiesItems.where((item) {
      double itemPrice = item.newPrice;
      double itemDistance = double.parse(item.distance.split(' ')[0]);
      bool matchesSearchTerm = item.name.toLowerCase().contains(searchTerm.toLowerCase());
      return itemPrice >= minPrice &&
          itemPrice <= maxPrice &&
          itemDistance >= minDistance &&
          itemDistance <= maxDistance &&
          matchesSearchTerm;
    }).toList();

    List<ItemCard> filteredFoodItems = foodItems.where((item) {
      double itemPrice = item.newPrice;
      double itemDistance = double.parse(item.distance.split(' ')[0]);
      bool matchesSearchTerm = item.name.toLowerCase().contains(searchTerm.toLowerCase());
      return itemPrice >= minPrice &&
          itemPrice <= maxPrice &&
          itemDistance >= minDistance &&
          itemDistance <= maxDistance &&
          matchesSearchTerm;
    }).toList();

    // Display only first four items for each category
    List<ItemCard> displayedAllProductsItems = filteredAllProductsItems.take(4).toList();
    List<ItemCard> displayedFruitsAndVeggiesItems = filteredFruitsAndVeggiesItems.take(4).toList();
    List<ItemCard> displayedFoodItems = filteredFoodItems.take(4).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'chercher des paniers',
                prefixIcon: Icon(Icons.search, color: Color.fromRGBO(152, 203, 81, 1)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.filter_list, color: Color.fromRGBO(152, 203, 81, 1)),
                  onPressed: () async {
                    final filters = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterScreen(
                          initialMinPrice: minPrice,
                          initialMaxPrice: maxPrice,
                          initialMinDistance: minDistance,
                          initialMaxDistance: maxDistance,
                        ),
                      ),
                    );
                    if (filters != null) {
                      setState(() {
                        minPrice = filters['minPrice'];
                        maxPrice = filters['maxPrice'];
                        minDistance = filters['minDistance'];
                        maxDistance = filters['maxDistance'];
                      });
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
          // Title and 'Voir tous' button for all products
          _buildSection(
            title: 'Les restaurants',
            items: displayedAllProductsItems,
            onVoirTousPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen(items: filteredAllProductsItems)),
              );
            },
          ),
          // Title and 'Voir tous' button for fruits and veggies
          _buildSection(
            title: 'les supermarchés',
            items: displayedFruitsAndVeggiesItems,
            onVoirTousPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen(items: filteredFruitsAndVeggiesItems)),
              );
            },
          ),
          // Title and 'Voir tous' button for food items
          _buildSection(
            title: 'les boulangerie',
            items: displayedFoodItems,
            onVoirTousPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen(items: filteredFoodItems)),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<ItemCard> items, required VoidCallback onVoirTousPressed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title with "Voir tous" button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onVoirTousPressed,
                child: Text(
                  'Voir tous',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.lightBlue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Item cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              return items[index];
            },
          ),
        ),
      ],
    );
  }
}
