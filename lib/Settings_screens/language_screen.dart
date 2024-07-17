import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'Français';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Langue', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Langue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              'Choisissez la langue que vous souhaitez afficher',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Français', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
              trailing: selectedLanguage == 'Français' ? Icon(Icons.radio_button_checked, color: Colors.green) : Icon(Icons.radio_button_unchecked),
              onTap: () {
                setState(() {
                  selectedLanguage = 'Français';
                });
              },
            ),
            ListTile(
              title: Text('Anglais', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
              trailing: selectedLanguage == 'Anglais' ? Icon(Icons.radio_button_checked, color: Colors.green) : Icon(Icons.radio_button_unchecked),
              onTap: () {
                setState(() {
                  selectedLanguage = 'Anglais';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
