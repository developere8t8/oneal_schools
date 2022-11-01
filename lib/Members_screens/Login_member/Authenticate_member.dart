import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneal_school/Members_screens/Login_member/login_member_page.dart';
import 'package:oneal_school/Members_screens/home_member_page.dart';

class AuthenticationMember extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomePage();
    } else {
      return LogInMember();
    }
  }
}
