import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:h_store/Screens/HomeScreen.dart';
import 'package:h_store/Screens/LoginForm.dart';
import 'package:h_store/Screens/RegisterForm.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {

    super.initState();
    _pageController = PageController();


  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff303030),
              Color(0xff303030),
              Color(0xff303030),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16.0),
                child: Center(
                  child: Text(
                    'Welcome  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                  child: Image.asset(
                'assets/logo.png',
                height: 200,
                width: 200,
              )),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(shape: BoxShape.rectangle),
                      child: GestureDetector(
                          onTap: () => _navigateToPage(0),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: _currentPageIndex == 0
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))),
                    ),

                    SizedBox(width: 16.0),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(shape: BoxShape.rectangle),
                      child: GestureDetector(
                          onTap: () => _navigateToPage(1),
                          child: Center(
                              child: Text(
                            "Register",
                            style: TextStyle(
                                color: _currentPageIndex == 1
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))),
                    ),


                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    LoginForm(),
                    RegisterForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> checkUserAuthentication() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is already logged in, navigate to home screen

      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });


    } else {
      // User is not logged in, navigate to login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    }
  }
}
