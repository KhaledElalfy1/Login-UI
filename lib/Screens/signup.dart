
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/widgets/custom_password_form_filed.dart';
import 'package:responsive_ui/widgets/custom_text_form_filed.dart';

import 'Login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
  // create five text editing controller for user name, email, password, confirm password and phone number and dispose it
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();

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
                'Register',
                style: TextStyle(color: Color(0xff646875), fontSize: 50),
              ),
              const Text(
                'create your account',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
               CustomTextFormFiled(
                controller: username,
                hintText: 'username',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormFiled(
                controller: email,
                onChange: (p0) => email.text = p0,
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomPasswordFiled(
                controller: password,
                onChanged: (p0) => password.text = p0,
                hintText: 'password',
              ),
              const SizedBox(
                height: 10,
              ),
               CustomPasswordFiled(
                  controller: confirmPassword,
                hintText: 'confirm password'),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: _registerFunction,
                child: Container(
                  width: 350,
                  height: 65,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff395BA9)),
                  child: const Text(
                    'Register',
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
                    "Already have an count?",
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
                            return LogInScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerFunction() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LogInScreen();
          },
        ));
      } on FirebaseAuthException catch (e) {
        _handelFirebaseException(e);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    
  }

  void _handelFirebaseException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
      
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
      
    }
  }
}
