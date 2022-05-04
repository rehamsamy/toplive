import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toplive/app/modules/auth/views/auth_view.dart';
import 'package:toplive/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';

class CheckSigningIn extends StatefulWidget {
  CheckSigningIn({Key? key}) : super(key: key);

  @override
  State<CheckSigningIn> createState() => _CheckSigningInState();
}

class _CheckSigningInState extends State<CheckSigningIn> {
  late FirebaseAuth _auth;

  User? _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? AuthView()
            : BottomNavBarView();
  }
}
