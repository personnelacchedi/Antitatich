import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class RulesScreen extends StatelessWidget {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Politiques et confidentialité',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildParagraph(
                      Icons.cookie,
                      'Nous utilisons des cookies et des technologies similaires pour améliorer votre expérience dans l\'application, analyser l\'utilisation et le trafic de l\'application, et personnaliser le contenu et les publicités.',
                    ),
                    _buildDivider(),
                    _buildParagraph(
                      Icons.security,
                      'Cookies obligatoires\n\nDonnées techniquement nécessaires et statistiques\n\nNous collectons les données techniquement nécessaires au bon fonctionnement de notre application. Ces données sont essentielles pour vous permettre de naviguer dans l\'application et d\'utiliser ses fonctionnalités.',
                    ),
                    _buildDivider(),
                    _buildParagraph(
                      Icons.analytics,
                      'Nous recueillons également des données statistiques qui nous permettent d\'analyser et de comprendre le trafic dans les applications, le comportement des utilisateurs et les modèles d\'utilisation au niveau agrégé. Les données statistiques obtenues à partir de l\'application sont agrégées et utilisées pour améliorer les performances et l\'expérience utilisateur de notre application.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);

              },
              icon: Icon(Icons.check, color: Colors.white),
              label: Text(
                'Accepter et continuer',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(152, 203, 81, 1), // Green color for the button
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                textStyle: TextStyle(
                  fontSize: 18.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, color: Color.fromRGBO(152, 203, 81, 1), size: 30),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2, // Thicker line
              color: Color.fromRGBO(255, 145, 77, 1), // Custom color
            ),
          ),
        ],
      ),
    );
  }
}
