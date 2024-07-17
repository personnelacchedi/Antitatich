import 'package:flutter/material.dart';

class StockManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Management'),
      ),
      body: Center(
        child: Text('Manage your stock and prices here.'),
      ),
    );
  }
}
