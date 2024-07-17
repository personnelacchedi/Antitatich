import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    SplashPage(
      title: '',
      imagePath: 'assets/images/image1.png',
      bottomText: 'Bienvenue à AntiTatich',
      description: '',
    ),
    FeatureSplashPage(
      imagePath: 'assets/images/image3.png',
      title: 'Vendez vos Excédents Alimentaires',
      description: 'Surveillez vos inventaires alimentaires pour réduire les déchets et économiser de l\'argent.',
    ),
    FeatureSplashPage(
      imagePath: 'assets/images/image4.png',
      title: 'Recevez des Rappels',
      description: 'Recevez des rappels pour utiliser les aliments avant qu\'ils n\'expirent.',
    ),
    FeatureSplashPage(
      imagePath: 'assets/images/image5.png',
      title: 'Trouvez des Opportunités',
      description: 'Trouvez des commerçants près de chez vous.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 60.0,
            left: 20.0,
            child: _currentPage > 0
                ? ElevatedButton(
              onPressed: _previousPage,
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(152, 203, 81, 1),
                padding: EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              child: Text(
                'Précédent',
                style: TextStyle(color: Colors.white),
              ),
            )
                : Container(),
          ),
          Positioned(
            bottom: 60.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(152, 203, 81, 1),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              child: Text(
                _currentPage < _pages.length - 1 ? 'Suivant' : 'Commencer',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Color.fromRGBO(152, 203, 81, 1) : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String bottomText;
  final String description;

  SplashPage({
    required this.title,
    required this.imagePath,
    required this.bottomText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(152, 203, 81, 1),
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Image.asset(
                imagePath,
                height: 300.0,
                width: 300.0,
              ),
              SizedBox(height: 20.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(152, 203, 81, 1),
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                bottomText,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(152, 203, 81, 1),
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureSplashPage extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String description;

  FeatureSplashPage({
    this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 16.0,
            left: 16.0,
            child: Image.asset(
              'assets/images/image1.png',
              height: 70.0,
              width: 70.0,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imagePath != null)
                    Image.asset(
                      imagePath!,
                      height: 300.0,
                      width: 300.0,
                    ),
                  SizedBox(height: 20.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(152, 203, 81, 1),
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
