import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_auth/email_auth.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void sendOtp() async {
    EmailAuth.sessionName = "Test Session";
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      print("otp send");
    } else {
      print("not send");
    }
  }

  void doneOtp() async {
    var res = EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _otpController.text);
    if (res) {
      print("otp send");
    } else {
      print("invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Email Otp"),
        leading: IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "@Email.com";
                    }
                    if (!value.contains("@")) {
                      return "@mail.com";
                    }
                  },
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => sendOtp(),
            child: Text("Send Otp"),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: _otpController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "OTP"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "invalid";
                  }
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => doneOtp(),
            child: Text("done"),
          ),
        ],
      ),
    );
  }
}
