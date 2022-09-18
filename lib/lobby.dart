import 'package:firebase_login/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_login/counting_app.dart';
import 'package:firebase_login/lab6_menu.dart';
import 'package:firebase_login/lab7_caculator.dart';
import 'package:firebase_login/lab8_menu.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Lobby extends StatelessWidget {
  const Lobby({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new SizedBox(
          width: 500,
          height: 100,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "LOBBY Application".toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),

        const SizedBox(height: 16),
        //
        new SizedBox(
          width: 450,
          height: 450,
          /*child: ElevatedButton(
            child: LoginScreenTopImage(),
            style: ElevatedButton.styleFrom(primary: kPrimarywhiteColor),
          ),*/
          child: Image.network(
              'https://cdn.dribbble.com/users/369527/screenshots/4301615/media/5c65cf06909ecfcce6698b8728e01abd.png?compress=1&resize=800x600&vertical=top'),
        ),
        //
        const SizedBox(height: 16),
        new SizedBox(
          width: 500,
          height: 50,
          child: ElevatedButton(
            child: Text("Counting App".toUpperCase(),
                style: TextStyle(color: Colors.black87, fontSize: 20)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //return Counting();
                    return Counting();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryLightColor, elevation: 0),
          ),
        ),

        const SizedBox(height: 16),

        new SizedBox(
          width: 500,
          height: 50,
          child: ElevatedButton(
            child: Text("FoodMenu".toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LAB6();
                  },
                ),
              );
            },
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
          ),
        ),

        const SizedBox(height: 16),

        new SizedBox(
          width: 500,
          height: 50,
          child: ElevatedButton(
            child: Text("Lab 7".toUpperCase(),
                style: TextStyle(color: Colors.black87, fontSize: 20)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LAB7();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryLightColor, elevation: 0),
          ),
        ),

        const SizedBox(height: 16),

        new SizedBox(
          width: 500,
          height: 50,
          child: ElevatedButton(
            child: Text("Lab 8".toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LAB8();
                  },
                ),
              );
            },
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
          ),
        ),

        const SizedBox(height: 16),

        new SizedBox(
          width: 100,
          height: 50,
          child: ElevatedButton(
            child: Text("Logout".toUpperCase(),
                style: TextStyle(color: Colors.black, fontSize: 15)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryLightColor, elevation: 0),
          ),
        ),
      ],
    );
  }
}
