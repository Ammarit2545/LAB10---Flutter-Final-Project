import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/Screens/Login/components/login_screen_top_image.dart';
import 'package:firebase_login/Screens/Login/login_screen.dart';
import 'package:firebase_login/lobby.dart';
import 'package:firebase_login/model/profile.dart';
import 'package:firebase_login/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Spacer(),
                      Expanded(flex: 8, child: LoginScreenTopImage()),
                      Spacer(),
                    ],
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อน Email ด้วยครับ"),
                      EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้อง"),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String email) {
                      profile.email = email;
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: RequiredValidator(
                        errorText: "กรุณาป้อน Password ด้วยครับ"),
                    obscureText: true,
                    onSaved: (String password) {
                      profile.password = password;
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 50,
                    width: 300,
                    child: SizedBox(
                      child: ElevatedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Lobby();
                                },
                              ),
                            );
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: profile.email,
                                    password: profile.password);

                            formKey.currentState.reset();

                            print(
                                "email = ${profile.email} password = ${profile.password}");
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Do You Need to Sign Up ?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryLightColor, elevation: 0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
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

    /*FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          /* if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("สร้างบัญชีผู้ใช้"),
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อีเมล",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "กรุณาป้อน Email ด้วยครับ"),
                              EmailValidator(
                                  errorText: "รูปแบบ Email ไม่ถูกต้อง"),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String email) {
                              profile.email = email;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "รหัสผ่าน",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อน Password ด้วยครับ"),
                              obscureText: true,
                              onSaved: (String password) {
                                profile.password = password;
                              }),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text(
                                "ลงทะเบียน",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  print(
                                      "email = ${profile.email} password = ${profile.password}");
                                  formKey.currentState.reset();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }*/
          else {
            return Scaffold(
              appBar: AppBar(
                title: Text("สร้างบัญชีผู้ใช้"),
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อีเมล",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "กรุณาป้อน Email ด้วยครับ"),
                              EmailValidator(
                                  errorText: "รูปแบบ Email ไม่ถูกต้อง"),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String email) {
                              profile.email = email;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "รหัสผ่าน",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อน Password ด้วยครับ"),
                              obscureText: true,
                              onSaved: (String password) {
                                profile.password = password;
                              }),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text(
                                "ลงทะเบียน",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  print(
                                      "email = ${profile.email} password = ${profile.password}");
                                  formKey.currentState.reset();
                                }
                              },
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
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });*/
    /*return Scaffold(
      appBar: AppBar(
        title: Text("สร้างบัญชีผู้ใช้"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "อีเมล",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อน Email ด้วยครับ"),
                      EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้อง"),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String email) {
                      profile.email = email;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "รหัสผ่าน",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                      validator: RequiredValidator(
                          errorText: "กรุณาป้อน Password ด้วยครับ"),
                      obscureText: true,
                      onSaved: (String password) {
                        profile.password = password;
                      }),
                  SizedBox(
                    child: ElevatedButton(
                      child: Text(
                        "ลงทะเบียน",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          print(
                              "email = ${profile.email} password = ${profile.password}");
                          formKey.currentState.reset();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }
}

/*
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    
  }
}*/


/*
class LoginForm extends StatelessWidget {
  LoginForm({
    Key key,
  }) : super(key: key);
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "อีเมล",
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "กรุณาป้อน Email ด้วยครับ"),
              EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้อง"),
            ]),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            /*
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (String email) {
              profile.email = email;
            },
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            */
            onSaved: (String email) {
              profile.email = email;
            },
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "รหัสผ่าน",
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
              validator:
                  RequiredValidator(errorText: "กรุณาป้อน Password ด้วยครับ"),
              obscureText: true,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              //child: Icon(Icons.lock),
              decoration: InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              onSaved: (String password) {
                profile.password = password;
              }),
          const SizedBox(height: 16),
          SizedBox(
            child: ElevatedButton(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Lobby();
                    },
                  ),
                );
              */

                if (formKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                  formKey.currentState.save();
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: profile.email, password: profile.password);
                  formKey.currentState.reset();
                  print(
                      "email = ${profile.email} password = ${profile.password}");

                  /*try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: profile.email,
                                    password: profile.password);
                            /*print(
                              "email = ${profile.email} password = ${profile.password}");*/
                            formKey.currentState.reset();
                          } on FirebaseAuthException catch (e) {
                            print(e.message);
                          }*/
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: ElevatedButton(
              child: Text(
                "ลงทะเบียน",
                style: TextStyle(fontSize: 20),
              ),
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
            ),
          ),
        ],
      ),
      /*Column(
        children: [
          TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "กรุณาป้อน Email ด้วยครับ"),
              EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้อง"),
            ]),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (String email) {
              profile.email = email;
            },
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          /*
          TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อน Email ด้วยครับ"),
                      EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้อง"),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String email) {
                      profile.email = email;
                    },
                  ),
           */
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                /*Text(
                    "รหัสผ่าน",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                      validator: RequiredValidator(
                          errorText: "กรุณาป้อน Password ด้วยครับ"),
                      obscureText: true,
                      onSaved: (String password) {
                        profile.password = password;
                      }), */
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          /*TextFormField(
              validator:
                  RequiredValidator(errorText: "กรุณาป้อน Password ด้วยครับ"),
              obscureText: true,
              onSaved: (String password) {
                profile.password = password;
              }),*/
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Lobby();
                    },
                  ),
                );
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),*/
    );
  }
}*/
