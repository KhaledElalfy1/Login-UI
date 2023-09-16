import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/Screens/Login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff395BA9),
      appBar: AppBar(
        backgroundColor: const Color(0xff395BA9),
        elevation: 0,
        title: const Text('Login app'),
        leading: const Text(''),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LogInScreen();
                  },
                ));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Welcome name 🎉',
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Center(
            child: Text(
              'Flutter',
              style: TextStyle(color: Color(0xff1A294D), fontSize: 70),
            ),
          ),
          FirebaseAuth.instance.currentUser!.emailVerified
              ? const Text('Verified')
              : MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    try {
                      FirebaseAuth.instance.currentUser!
                          .sendEmailVerification();
                      showDialog(context, 'email is sended').show();
                    } on Exception catch (_) {
                      showDialog(
                              context, 'Error while sending email verification')
                          .show();
                    }
                  },
                  child: const Text('Please Verify your email'),
                ),
        ],
      ),
    );
  }

  AwesomeDialog showDialog(BuildContext context, String message) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'Dialog Title',
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    );
  }
}
