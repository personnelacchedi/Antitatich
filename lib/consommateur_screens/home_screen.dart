import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/consommateur_screens/restaurant_screen.dart';
import 'cart_screen.dart';
import 'item_detail_screen.dart';
import 'filter_screen.dart';
import 'cart_model.dart';
import 'map_screen.dart';
import 'messagerie_screen.dart';
import 'all_products_screen.dart';
import 'item_card.dart';

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
    RestaurantScreen(),
    MessagerieScreen(),
    MapScreen(),
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
      appBar: (_selectedIndex == 0 || _selectedIndex == 1)
          ? AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined,
                    color: Color.fromRGBO(152, 203, 81, 1), size: 35),
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
            Icon(
              FontAwesomeIcons.locationDot,
              color: Color.fromRGBO(152, 203, 81, 1),
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              'Rue 1002, Tunis',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      )
          : null,
      body: _selectedIndex == 0
          ? HomeContent(
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        minDistance: _minDistance,
        maxDistance: _maxDistance,
      )
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 28,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/commerce.png',
              width: 28,
              height: 24,
            ),
            label: 'commerce',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/messagerie.png',
              width: 28,
              height: 24,
            ),
            label: 'Messagerie',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/map.png',
              width: 28,
              height: 24,
            ),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(152, 203, 81, 1),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24,
        ),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
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
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String searchTerm = '';
  String selectedFilter = 'All';

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

    // Filter items based on search term, selected filter, and other filters
    List<ItemCard> filteredItems = [];
    if (selectedFilter == 'All') {
      filteredItems = allProductsItems + fruitsAndVeggiesItems + foodItems;
    } else if (selectedFilter == 'legumes et fruits') {
      filteredItems = fruitsAndVeggiesItems;
    } else if (selectedFilter == 'FastFood') {
      filteredItems = foodItems;
    }

    filteredItems = filteredItems.where((item) {
      double itemPrice = item.newPrice;
      double itemDistance = double.parse(item.distance.split(' ')[0]);
      bool matchesSearchTerm = item.name.toLowerCase().contains(searchTerm.toLowerCase());
      return itemPrice >= widget.minPrice &&
          itemPrice <= widget.maxPrice &&
          itemDistance >= widget.minDistance &&
          itemDistance <= widget.maxDistance &&
          matchesSearchTerm;
    }).toList();

    // Display only first four items
    List<ItemCard> displayedItems = filteredItems.take(4).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Search bar and filter buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search bar
                TextField(
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
                              initialMinPrice: widget.minPrice,
                              initialMaxPrice: widget.maxPrice,
                              initialMinDistance: widget.minDistance,
                              initialMaxDistance: widget.maxDistance,
                            ),
                          ),
                        );
                        if (filters != null) {
                          (context.findAncestorStateOfType<_HomeScreenState>())?._applyFilters(filters);
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
                // Filter buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterButton(icon: 'assets/images/pizza.png', label: 'FastFood', onSelected: _onFilterSelected),
                      FilterButton(icon: 'assets/images/meat.png', label: 'boucherie', onSelected: _onFilterSelected),
                      FilterButton(icon: 'assets/images/fish.png', label: 'poison', onSelected: _onFilterSelected),
                      FilterButton(icon: 'assets/images/bread.png', label: 'Boulangerie', onSelected: _onFilterSelected),
                      FilterButton(icon: 'assets/images/basket.png', label: 'legumes et fruits', onSelected: _onFilterSelected),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Title and 'Voir tous' button for all products
          _buildSection(
            title: 'Tous les produits',
            items: displayedItems,
            onVoirTousPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen(items: filteredItems)),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter == selectedFilter ? 'All' : filter;
    });
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
                    fontSize: 15,
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
              mainAxisSpacing: 10,
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



class FilterButton extends StatefulWidget {
  final String icon;
  final String label;
  final ValueChanged<String> onSelected;

  FilterButton({
    required this.icon,
    required this.label,
    required this.onSelected,
  });

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onSelected(widget.label);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Color.fromRGBO(218, 236, 192, 1) : Colors.transparent,
                border: Border.all(color: Color.fromRGBO(152, 203, 81, 1), width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  widget.icon,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(widget.label, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}




