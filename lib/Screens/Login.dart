import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/Screens/signup.dart';
import 'package:responsive_ui/services/google_auth.dart';
import 'package:responsive_ui/widgets/custom_password_form_filed.dart';
import 'package:responsive_ui/widgets/custom_text_form_filed.dart';

import 'home.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // create global key for form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffDAE2FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome back',
                style: TextStyle(color: Color(0xff646875), fontSize: 50),
              ),
              const Text(
                'Login to your account',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormFiled(
                controller: email,
                onChange: (p0) => email.text = p0,
                hintText: 'username',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPasswordFiled(
                controller: password,
                hintText: 'password',
                onChanged: (p0) => password.text = p0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    if (email.text == "") {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Dialog Title',
                        desc: 'Kindly enter your email',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                      return;
                    }
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: 'Dialog Title',
                        desc: 'Kindly check your email',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    } on Exception catch (e) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Dialog Title',
                        desc: 'enter valid email',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                  child: const Text('Forgot password?'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: _loginFunction,
                child: Container(
                  width: 350,
                  height: 65,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xff395BA9),
                  ),
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an count?",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 2),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // create container to sign in with google
              GestureDetector(
                onTap: () {
                  AuthServices().signInWithGoogle().then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  });
                },
                child: Container(
                  width: 350,
                  height: 65,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff395BA9)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sign in with google',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginFunction() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        if (credential.user!.emailVerified) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        } else {
          credential.user!.sendEmailVerification();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Dialog Title',
            desc: 'Kindly verify your email',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      } on FirebaseAuthException catch (e) {
        _handleFirebaseExceptions(e);
      }
    }
  }

  void _handleFirebaseExceptions(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      // debugPrint('No user found for that email.');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Dialog Title',
        desc: 'No user found for that email',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    } else if (e.code == 'wrong-password') {
      // debugPrint('Wrong password provided for that user.');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Dialog Title',
        desc: 'Wrong password provided for that user',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    }
  }
}
