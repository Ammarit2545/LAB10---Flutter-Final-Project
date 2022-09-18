import 'package:firebase_login/Screens/Login/components/login_form.dart';
import 'package:firebase_login/screen/register.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 300,
          child: Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginForm();
                    },
                  ),
                );
              },
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 50,
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryLightColor, elevation: 0),
            child: Text(
              "Sign Up".toUpperCase(),
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
