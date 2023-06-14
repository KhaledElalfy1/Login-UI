

import 'package:flutter/material.dart';
import 'package:responsive_ui/Screens/signup.dart';

import 'home.dart';
class LogInScreen extends StatefulWidget {
  final TextEditingController _userName= TextEditingController();

   LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
 late  bool _obscureText = true;

  final double raduis=10;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffDAE2FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [

          const Text('Welcome back',
            style: TextStyle(
              color: Color(0xff646875),
              fontSize: 50
            ),
          ),
          const Text('Login to your account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),
          ),
          const  SizedBox(height:50 ,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8  ),
            child: TextField(
              controller: widget._userName,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'username',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(raduis)
                )
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(onPressed: ()
                {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }
                    ,icon:Icon(_obscureText ? Icons.visibility : Icons.visibility_off)
                ),
                hintText: 'password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(raduis)
                )
              ),
            ),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  HomeScreen(name: widget._userName.text,);
              },));
            },
            child:Container(
              width: 350,
              height: 65,
              alignment: Alignment.center,
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xff395BA9)
              ) ,
              child: const Text('login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ) ,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an count?",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  },),

                  );
                },
                child:const  Text('Signup',
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
