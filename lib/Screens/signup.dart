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
              const CustomTextFormFiled(
                hintText: 'username',
                prefixIcon: Icon(Icons.person),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextFormFiled(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomPasswordFiled(hintText: 'password'),
              const SizedBox(
                height: 10,
              ),
              const CustomPasswordFiled(hintText: 'confirm password'),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LogInScreen();
                    },
                  ));
                },
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
}
