import 'package:flutter/material.dart';
import 'signup_consommateur_screen.dart';
import 'login_screen.dart'; // Import the login screen

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white, // Set background color to white
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(), // Push the content to the middle
            Image.asset(
              'assets/images/image1.png',
              height: 220.0, // Increased height
              width: 220.0, // Increased width
            ),
            Spacer(), // Push the buttons to the bottom
            GradientButton(
              text: 'S\'inscrire',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpConsommateurScreen()),
                );
              },
            ),
            SizedBox(height: 10.0),
            GradientButton(
              text: 'Se connecter',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Ou connectez-vous avec',
              style: TextStyle(
                color: Color.fromRGBO(152, 203, 81, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(
                  imagePath: 'assets/images/google_icon.png', // Google icon image path
                  size: 36.0, // Smaller size for the Google icon
                  onPressed: () {
                    // Add Google login functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({required String imagePath, required double size, required VoidCallback onPressed}) {
    return IconButton(
      icon: Image.asset(imagePath, width: size, height: size), // Set the size for the Google icon
      iconSize: size,
      onPressed: onPressed,
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [Color.fromRGBO(152, 203, 81, 1), Color.fromRGBO(152, 203, 81, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat', // Use Montserrat font
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Make the text bold
            fontFamily: 'Montserrat', // Use Montserrat font
          ),
        ),
      ),
    );
  }
}
