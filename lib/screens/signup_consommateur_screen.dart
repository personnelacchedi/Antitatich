import 'package:flutter/material.dart';
import 'signup_consommateur1_screen.dart'; // Import the next screen
import 'rules_screen.dart'; // Import the RulesScreen

class SignUpConsommateurScreen extends StatefulWidget {
  @override
  _SignUpConsommateurScreenState createState() => _SignUpConsommateurScreenState();
}

class _SignUpConsommateurScreenState extends State<SignUpConsommateurScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    // Dummy implementation to simulate geolocation
    _adresseController.text = "Dummy Location";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 203, 81, 1), // Light green background
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Créer un compte',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/image6.png',
                    height: 100.0, // Adjust the height as needed
                    width: 100.0, // Adjust the width as needed
                  ),
                  SizedBox(height: 20),
                  _buildTextField(_nomController, 'Nom', Icons.person),
                  SizedBox(height: 10),
                  _buildTextField(_prenomController, 'Prénom', Icons.person_outline),
                  SizedBox(height: 10),
                  _buildTextField(_adresseController, 'Adresse', Icons.location_on, suffixIcon: Icons.my_location, onSuffixIconPressed: _getCurrentLocation),
                  SizedBox(height: 20),
                  GradientButton(
                    text: 'Suivant',
                    onPressed: _nextPage,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RulesScreen()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'En vous inscrivant, vous acceptez nos ',
                          style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'conditions et notre politique de confidentialité',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String labelText,
      IconData icon, {
        bool isPassword = false,
        TextInputType keyboardType = TextInputType.text,
        IconData? suffixIcon,
        VoidCallback? onSuffixIconPressed,
      }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.green[900], fontFamily: 'Montserrat'),
        prefixIcon: Icon(icon, color: Colors.green[700]),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: Colors.green[700]),
          onPressed: onSuffixIconPressed,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green[700]!),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }

  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpConsommateur1Screen()),
      );
    }
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
            fontFamily: 'Montserrat',
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
