import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otpscreen/otp/send_screen.dart';

import 'google/chrom_screen.dart';
import 'otp/Otp_Sir_Screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Chrom(),
    );
  }
}
