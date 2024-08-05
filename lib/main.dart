import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'consommateur_screens/home_screen.dart';
import 'consommateur_screens/cart_model.dart';
import 'Settings_screens/settings_screen.dart';  // Import the settings screen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: FoodWasteApp(),
    ),
  );
}

class FoodWasteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Waste App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomeScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/settings': (context) => SettingsScreen(),  // Add route for settings screen
      },
    );
  }
}
