import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import 'language_screen.dart';
import 'details_de_compte_screen.dart';
import 'historique_des_commandes_screen.dart';
import 'package:untitled/screens/welcome_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(55,73,29,1),
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.green),
            title: Text('Détails du compte', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsDeCompteScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.credit_card_outlined, color: Colors.green),
            title: Text('Carte de paiement', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Navigate to payment card
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language_outlined, color: Colors.green),
            title: Text('Langue', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
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
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoriqueDesCommandesScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications_outlined, color: Colors.green),
            title: Text('Notifications', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
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
            leading: Icon(Icons.group_add_outlined, color: Colors.green),
            title: Text('Rejoindre Antitatich', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Navigate to join Antitatich
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.green),
            title: Text('Aide et assistance', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Navigate to help and support
            },
          ),
          Divider(),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
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
