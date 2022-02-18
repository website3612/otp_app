import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otpscreen/otp/home_screen.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  final String matchId;

  OtpScreen({required this.matchId});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth _authBase = FirebaseAuth.instance;

  final _otpController = TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _authBase.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      _globalKey.currentState!
        ..showSnackBar(
          SnackBar(
            content: Text("$e.message"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("home screen"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("otp screen"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _otpController,
                decoration: InputDecoration(hintText: "enter otp"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                  verificationId: widget.matchId,
                  smsCode: _otpController.text,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Text('Send otp'),
            )
          ],
        ),
      ),
    );
  }
}
