
import 'package:flutter/material.dart';
import 'package:responsive_ui/Screens/Login.dart';
class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color(0xff395BA9) ,
      appBar: AppBar(
        backgroundColor:const Color(0xff395BA9),
        elevation: 0,
        title:const Text('Login app'),
        leading: const Text(''),
        actions: [IconButton(onPressed: ()
        {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return  LogInScreen();
            },));
        },
            icon: const Icon(Icons.arrow_forward))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome $name 🎉',
              style:  const TextStyle(
                fontSize: 25
              ),
            ),
          ),
           const Center(
            child: Text('Flutter',
            style: TextStyle(
              color: Color(0xff1A294D),
              fontSize: 70
            ),
            ),
          )
        ],
      )

    );
  }
}
