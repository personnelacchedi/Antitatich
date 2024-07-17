import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import 'language_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Paramètres',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.green),
            title: Text('Détails du compte', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              // Navigate to account details
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.green),
            title: Text('Carte de paiement', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              // Navigate to payment card
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text('Langue', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history, color: Colors.green),
            title: Text('Historique des commandes', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              // Navigate to order history
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text('Notifications', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
          Divider(),
          SizedBox(height: 20),
          Text(
            'Aide',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.group_add, color: Colors.green),
            title: Text('Rejoindre Antitatich', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              // Navigate to join Antitatich
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.green),
            title: Text('Aide et assistance', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            onTap: () {
              // Navigate to help and support
            },
          ),
          Divider(),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.red,
                side: BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),

              child: Text(
                'Se déconnecter',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
