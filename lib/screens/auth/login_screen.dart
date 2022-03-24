import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/onboarding.jpg',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: CustomButton(
              text: 'Login',
              onPressed: () {
                _authController.signinWithGoogle();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
