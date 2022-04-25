import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toplive/app/modules/auth/views/phone_flow/otp_verification.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //////////////////
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  bool isPhoneOk = false;
  String authUserID = "";
  final phone = TextEditingController();
  final otp = TextEditingController();
  var auth = FirebaseAuth.instance;
  final Rxn<User> user = Rxn<User>();
  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 120),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {
          print("Login Successfully");
          if (auth.currentUser != null) {
            authUserID = auth.currentUser!.uid;
            isLoading.value = false;
            authStatus.value = "login successfully";
          }
        },
        verificationFailed: (authException) {
          Get.snackbar("sms code info", "otp code hasn't been sent!!");
        },
        codeSent: (String id, [int? forceResent]) {
          print("Code Sent $id");

          isLoading.value = false;
          // ignore: unnecessary_this
          this.verId = id;
          authStatus.value = "login successfully";

          Get.to(() => VerifyCodePage());
        },
        codeAutoRetrievalTimeout: (String id) {
          verId = id;
        });
  }

  Future<bool> otpVerify(String otp) async {
    isLoading.value = true;
    try {
      print("trying to verify");

      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: verId, smsCode: otp));
      if (userCredential.user != null) {
        isLoading.value = false;
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      }
    } on Exception catch (e) {
      Get.snackbar("otp info", " ${e.toString()}");
    }
    return false;
  }
}
