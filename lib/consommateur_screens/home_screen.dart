import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';
import 'item_detail_screen.dart';
import 'filter_screen.dart';
import 'cart_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  double _minPrice = 0;
  double _maxPrice = 100;
  double _minDistance = 0;
  double _maxDistance = 50;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text('Restaurant Screen Content Goes Here'),
    Text('Messagerie Screen Content Goes Here'),
    Text('Map Screen Content Goes Here'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _applyFilters(Map<String, dynamic> filters) {
    setState(() {
      _minPrice = filters['minPrice'];
      _maxPrice = filters['maxPrice'];
      _minDistance = filters['minDistance'];
      _maxDistance = filters['maxDistance'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartItemCount = context.watch<CartModel>().totalItems;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.green, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 7,
                top: 7,
                child: cartItemCount > 0
                    ? Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 13,
                    minHeight: 13,
                  ),
                  child: Text(
                    '$cartItemCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    : Container(),
              ),
            ],
          ),
        ],
        title: Row(
          children: [
            Icon(FontAwesomeIcons.locationDot, color: Colors.green),
            SizedBox(width: 5),
            Text(
              'Rue 1002, Tunis',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? HomeContent(
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        minDistance: _minDistance,
        maxDistance: _maxDistance,
      )
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_outlined),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messagerie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        backgroundColor: Color.fromRGBO(152, 203, 81, 1),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final double minDistance;
  final double maxDistance;

  HomeContent({
    this.minPrice = 0,
    this.maxPrice = 100,
    this.minDistance = 0,
    this.maxDistance = 50,
  });

  @override
  Widget build(BuildContext context) {
    // Example items
    List<ItemCard> items = [
      ItemCard(
        imageUrl: 'assets/images/image9.png',
        name: 'Pain ciabatta',
        description: 'Description of Pain ciabatta',
        oldPrice: 2.00,
        newPrice: 1.50,
        distance: '4 km',
        rating: 4.7,
        discount: '30%',
        availablePieces: 22,
        storeName: 'Yummy Food',
        deliveryAvailable: false,
      ),
      ItemCard(
        imageUrl: 'assets/images/image9.png',
        name: 'Sandwich Poulet',
        description: 'Description of Sandwich Poulet',
        oldPrice: 6.00,
        newPrice: 4.50,
        distance: '4 km',
        rating: 4.7,
        discount: '30%',
        availablePieces: 15,
        storeName: 'Yummy Food',
        deliveryAvailable: true,
      ),
    ];

    // Filter items
    items = items.where((item) {
      double itemPrice = item.newPrice;
      double itemDistance = double.parse(item.distance.split(' ')[0]);
      return itemPrice >= minPrice &&
          itemPrice <= maxPrice &&
          itemDistance >= minDistance &&
          itemDistance <= maxDistance;
    }).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search restaurants, plats',
                    prefixIcon: Icon(Icons.search, color: Colors.green),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.sort, color: Colors.green),
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
                          HomeContent(
                            minPrice: filters['minPrice'],
                            maxPrice: filters['maxPrice'],
                            minDistance: filters['minDistance'],
                            maxDistance: filters['maxDistance'],
                          );
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
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterButton(icon: 'assets/images/image9.png', label: 'Tous'),
                      FilterButton(icon: 'assets/images/image9.png', label: 'Boissons'),
                      FilterButton(icon: 'assets/images/image9.png', label: 'Laitière'),
                      FilterButton(icon: 'assets/images/image9.png', label: 'Boulangerie'),
                      FilterButton(icon: 'assets/images/image9.png', label: 'Voir plus'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(children: items),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String icon;
  final String label;

  FilterButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(icon),
            radius: 25,
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
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

  ItemCard({
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

  void _showItemDetails(BuildContext context) {
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
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showItemDetails(context),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
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
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        discount,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '$availablePieces Pièces',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }
}
