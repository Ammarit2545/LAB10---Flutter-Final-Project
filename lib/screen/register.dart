import 'package:firebase_login/Screens/Login/components/login_form.dart';
import 'package:firebase_login/Screens/Login/login_screen.dart';
import 'package:firebase_login/constants.dart';
import 'package:firebase_login/model/profile.dart';
import 'package:firebase_login/screen/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up your email"),
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
                      }),
                  Container(
                    height: 50,
                    width: 300,
                    child: SizedBox(
                      child: ElevatedButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: profile.email,
                                    password: profile.password);
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
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  Text(
                    "Do You have Email ?",
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
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
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

