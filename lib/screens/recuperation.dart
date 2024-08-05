import 'package:flutter/material.dart';

class RecuperationScreen extends StatefulWidget {
  @override
  _RecuperationScreenState createState() => _RecuperationScreenState();
}

class _RecuperationScreenState extends State<RecuperationScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handlePinInput(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'récupération de mot de passe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Accédez à Votre Compte en Toute Sécurité',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) => _buildPinField(index)),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Vous n'avez pas reçu le code ? ",
                  style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                  children: [
                    TextSpan(
                      text: 'Renvoyer',
                      style: TextStyle(
                        color: Color.fromRGBO(152, 203, 81, 1),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _verifyCode,
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(152, 203, 81, 1),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                'Se connecter',
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinField(int index) {
    return Container(
      width: 40,
      height: 40,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Ensure the input text is black
          fontFamily: 'Montserrat',
        ),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(152, 203, 81, 1)),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) => _handlePinInput(index, value),
      ),
    );
  }

  void _verifyCode() {
    String code = _controllers.map((controller) => controller.text).join();
    // Handle the verification logic here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Code: $code')));
  }
}
