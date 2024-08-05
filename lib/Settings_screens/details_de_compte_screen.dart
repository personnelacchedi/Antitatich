import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class DetailsDeCompteScreen extends StatefulWidget {
  @override
  _DetailsDeCompteScreenState createState() => _DetailsDeCompteScreenState();
}

class _DetailsDeCompteScreenState extends State<DetailsDeCompteScreen> {
  File? _profileImage;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profileImagePath', image.path);
    }
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationController.text = "${position.latitude}, ${position.longitude}";
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('location', _locationController.text);
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? 'nom et prénom';
      _emailController.text = prefs.getString('email') ?? 'email@gmail.com';
      _passwordController.text = prefs.getString('password') ?? '************';
      _locationController.text = prefs.getString('location') ?? 'click on the icon to get your coordinates';
      String? profileImagePath = prefs.getString('profileImagePath');
      if (profileImagePath != null) {
        _profileImage = File(profileImagePath);
      }
    });
  }

  Future<void> _saveChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('password', _passwordController.text);
    prefs.setString('location', _locationController.text);
    print("Changes saved:");
    print("Name: ${_nameController.text}");
    print("Email: ${_emailController.text}");
    print("Password: ${_passwordController.text}");
    print("Location: ${_locationController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du compte', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Détails du compte',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(55, 73, 29, 1),
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              'Activez et désactivez les notifications que vous ne souhaitez pas recevoir',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(79, 106, 42, 1),
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage('assets/profile_placeholder.png') as ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(128, 171, 68, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom et prénom',
                labelStyle: TextStyle(color: Color.fromRGBO(83, 86, 83, 1), fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
              ),
              style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color.fromRGBO(83, 86, 83, 1), fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
              ),
              style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 16),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(color: Color.fromRGBO(83, 86, 83, 1), fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Color.fromARGB(255, 152, 203, 81),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 16),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _locationController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Localisation',
                labelStyle: TextStyle(color: Color.fromRGBO(83, 86, 83, 1), fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                suffixIcon: IconButton(
                  icon: Icon(Icons.my_location, color: Color.fromARGB(255, 152, 203, 81)),
                  onPressed: _getLocation,
                ),
              ),
              style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 16),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Color.fromRGBO(154, 75, 86, 1),
                    side: BorderSide(color: Color.fromRGBO(154, 75, 86, 1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Annuler',
                    style: TextStyle(
                      color: Color.fromRGBO(154, 75, 86, 1),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _saveChanges();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(152, 203, 81, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
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
}
