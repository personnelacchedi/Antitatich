import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SignUpCommercantScreen extends StatefulWidget {
  @override
  _SignUpCommercantScreenState createState() => _SignUpCommercantScreenState();
}

class _SignUpCommercantScreenState extends State<SignUpCommercantScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _adresseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedCommerceType;
  final List<String> _commerceTypes = [
    'Supermarché',
    'Boucherie',
    'Restaurant',

    // Add more options here
  ];

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _adresseController.text = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription Commerçant'),
        backgroundColor: Colors.green[200], // Light green background
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(_nomController, 'Nom', Icons.person),
                SizedBox(height: 10),
                _buildTextField(_prenomController, 'Prénom', Icons.person_outline),
                SizedBox(height: 10),
                _buildTextField(_emailController, 'Email', Icons.email, keyboardType: TextInputType.emailAddress),
                SizedBox(height: 10),
                _buildTextField(_adresseController, 'Adresse', Icons.location_on, suffixIcon: Icons.my_location, onSuffixIconPressed: _getCurrentLocation),
                SizedBox(height: 10),
                _buildDropdownField(
                  label: 'Type de commerce',
                  value: _selectedCommerceType,
                  items: _commerceTypes,
                  onChanged: (value) {
                    setState(() {
                      _selectedCommerceType = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                _buildTextField(_passwordController, 'Mot de passe', Icons.lock, isPassword: true),
                SizedBox(height: 10),
                _buildTextField(_confirmPasswordController, 'Confirmation de mot de passe', Icons.lock_outline, isPassword: true),
                SizedBox(height: 20),
                GradientButton(
                  text: 'S\'inscrire',
                  onPressed: _signUp,
                ),
              ],
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
        labelStyle: TextStyle(color: Colors.green[900]),
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
          return 'Veuillez entrer $labelText';
        }
        return null;
      },
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green[900]),
        prefixIcon: Icon(Icons.store, color: Colors.green[700]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green[700]!),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          onChanged: onChanged,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Perform the signup logic here
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signing up Commerçant...')));
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _adresseController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
          colors: [Colors.green[700]!, Colors.green[400]!],
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
