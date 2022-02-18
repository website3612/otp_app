import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class SendOtpScreen extends StatefulWidget {
  @override
  _SendOtpScreenState createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final _phoneController = TextEditingController();

  bool _showLoading = false;
  FirebaseAuth _authBase = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  late String matchId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("number screen"),
      ),
      body: Center(
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("enter your mobile number"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "empty";
                      }
                    },
                    controller: _phoneController,
                    maxLength: 10,
                    decoration: InputDecoration(hintText: "Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await _authBase.verifyPhoneNumber(
                        phoneNumber: "+91{$_phoneController.text}",
                        verificationCompleted: (phoneAuthCredential) async {},
                        verificationFailed: (verificationFailed) async {
                          _globalKey.currentState!.showSnackBar(
                              SnackBar(content: Text("Not send Message")));
                        },
                        codeSent: (matchId, resendingToken) async {
                          this.matchId = matchId;
                        },
                        codeAutoRetrievalTimeout: (verificationId) async {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            matchId: matchId,
                          ),
                        ));
                  },
                  child: Text("send Otp")),
              // SizedBox(
              //   height: 50,
              // ),
              // Text("otp screen"),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: _otpController,
              //     decoration: InputDecoration(hintText: "enter otp"),
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     PhoneAuthCredential phoneAuthCredential =
              //         PhoneAuthProvider.credential(
              //             verificationId: matchId, smsCode: _otpController.text);
              //   },
              //   child: Text('Send otp'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
