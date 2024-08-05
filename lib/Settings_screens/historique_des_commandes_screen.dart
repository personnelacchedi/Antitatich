import 'package:flutter/material.dart';

class HistoriqueDesCommandesScreen extends StatefulWidget {
  @override
  _HistoriqueDesCommandesScreenState createState() => _HistoriqueDesCommandesScreenState();
}

class _HistoriqueDesCommandesScreenState extends State<HistoriqueDesCommandesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des commandes', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          tabs: [
            Tab(text: 'En cours'),
            Tab(text: 'Historique'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(context, 'en cours'),
          _buildOrderList(context, 'historique'),
        ],
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, String type) {
    List<Map<String, String>> orders = [
      {'id': '345', 'status': type == 'en cours' ? 'en cours de livraison' : 'livrée', 'date': 'Octobre 26, 2024', 'amount': '50 TND'},
      // Add more orders here
    ];

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.shopping_basket, color: Colors.white),
          ),
          title: Text('Commande #${order['id']}', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
          subtitle: Text('${order['status']}\n${order['date']}', style: TextStyle(fontFamily: 'Montserrat')),
          trailing: Text(order['amount']!, style: TextStyle(fontFamily: 'Montserrat', color: Colors.green,fontSize: 20)),
          isThreeLine: true,
        );
      },
    );
  }
}
