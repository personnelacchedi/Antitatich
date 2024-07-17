import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'stock_management_screen.dart';
import 'donation_options_screen.dart';
import 'transaction_history_screen.dart';

class CommercantScreen extends StatefulWidget {
  @override
  _CommercantScreenState createState() => _CommercantScreenState();
}

class _CommercantScreenState extends State<CommercantScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StockManagementScreen(),
    DonationOptionsScreen(),
    TransactionHistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Stock Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800], // Keeping the original color for selected items
        unselectedItemColor: Colors.green[400], // Keeping the original color for unselected items
        backgroundColor: Colors.grey[800], // Darker background color
        onTap: _onItemTapped,
      ),
    );
  }
}
