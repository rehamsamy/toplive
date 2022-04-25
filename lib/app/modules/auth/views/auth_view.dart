import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/color_manger.dart';

import '../controllers/auth_controller.dart';
import 'phone_flow/phone_number.dart';
import 'widgets/login_button.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  ColorsManger.primary.withOpacity(.5), BlendMode.darken),
              image: AssetImage(
                Assets.assetsImagesAuthBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Container(
                child: Image.asset(
                  Assets.assetsImagesLogo,
                ),
                width: MediaQuery.of(context).size.width * .5,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              //button for sign in with google , facebook , phone

              LoginButton(
                asset: Assets.assetsImagesFacebook,
                text: "Sign in with facebook".tr,
                backgroundColor: Colors.blue,
                onPressed: () => controller
                    .signInWithFacebook()
                    .then((value) => Get.offAllNamed(Routes.BOTTOM_NAV_BAR)),
                foregroundColor: ColorsManger.white,
              ),
              LoginButton(
                asset: Assets.assetsImagesGoogle,
                text: "Sign in with google".tr,
                backgroundColor: Colors.white,
                onPressed: () => controller
                    .signInWithGoogle()
                    .then((value) => Get.offAllNamed(Routes.BOTTOM_NAV_BAR)),
                foregroundColor: Color(0xffFF095C),
              ),
              LoginButton(
                asset: Assets.assetsImagesMobile,
                text: "Sign in with phone".tr,
                backgroundColor: Colors.red,
                onPressed: () => Get.to(() => PhoneNumberScreen()),
                foregroundColor: ColorsManger.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
