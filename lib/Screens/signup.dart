
import 'package:flutter/material.dart';

import 'Login.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final double raduis=10;
bool _obsecureText1= true;
bool _obsecureText2= true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffDAE2FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [

          const Text('Register',
            style: TextStyle(
                color: Color(0xff646875),
                fontSize: 50
            ),
          ),
          const Text('create your account',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
          const  SizedBox(height:50 ,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8  ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon:const Icon(Icons.person),
                  hintText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis)
                  )
              ),
            ),
          ),
          Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon:const  Icon(Icons.email_outlined),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis)
                  )
              ),
            ),
          ),
          Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: TextField(
              obscureText:_obsecureText1 ,
              decoration: InputDecoration(
                  prefixIcon:const  Icon(Icons.password),
                  suffixIcon:  IconButton(onPressed: (){
                    setState(() {
                      _obsecureText1 =! _obsecureText1;
                    });
                  }
                      ,icon: Icon(_obsecureText1 ? Icons.visibility : Icons.visibility_off )
                  ),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis)
                  )
              ),
            ),
          ),
          Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: TextField(
              obscureText: _obsecureText2,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon:  IconButton(onPressed: ()
                  {
                    setState(() {
                      _obsecureText2 =! _obsecureText2;
                    });
                  },
                    icon: Icon(_obsecureText2 ? Icons.visibility : Icons.visibility_off),
                  ),
                  hintText: 'confirm password',
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
                return   LogInScreen();
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
              child: const Text('Register',
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
              const Text("Already have an count?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  LogInScreen();
                  },),

                  );
                },
                child:const  Text('login',
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
