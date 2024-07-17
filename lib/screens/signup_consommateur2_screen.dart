import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SignUpConsommateur2Screen extends StatefulWidget {
  @override
  _SignUpConsommateur2ScreenState createState() => _SignUpConsommateur2ScreenState();
}

class _SignUpConsommateur2ScreenState extends State<SignUpConsommateur2Screen> {
  List<String> selectedOptions = [];

  void _toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

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
                'Compte créé !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Merci de nous aider à mieux vous recommander.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/image8.png',
                height: 150.0,
                width: 350.0,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  _buildOptionRow(['Végétarien', 'Dîner']),
                  _buildOptionRow(['Sans produits laitiers', 'Salé']),
                  _buildOptionRow(['Petit déjeuner', 'Dessert']),
                  _buildOptionRow(['Salades', 'Collations']),
                  _buildOptionRow(['Sucré']),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color.fromRGBO(152, 203, 81, 1),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(152, 203, 81, 1),
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Commencez',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionRow(List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: options.map((option) => _buildOptionButton(option)).toList(),
      ),
    );
  }

  Widget _buildOptionButton(String option) {
    bool isSelected = selectedOptions.contains(option);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton.icon(
        onPressed: () => _toggleOption(option),
        icon: Icon(
          Icons.add,
          color: isSelected ? Colors.white : Color.fromRGBO(152, 203, 81, 1),
          size: 24,
        ),
        label: Text(
          option,
          style: TextStyle(
            color: isSelected ? Colors.white : Color.fromRGBO(152, 203, 81, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Montserrat',
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Color.fromRGBO(152, 203, 81, 1) : Colors.white,
          onPrimary: Color.fromRGBO(152, 203, 81, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              color: Color.fromRGBO(152, 203, 81, 1),
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
      ),
    );
  }
}
