import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:toplive/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';
import 'package:toplive/core/resourses/color_manger.dart';

class PhoneNumberScreen extends GetView<AuthController> {
  PhoneNumberScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: controller.isLoading(false)
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage(Assets.assetsImagesWhiteBackground))),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            Container(
                              child: Image.asset(Assets.assetsImagesLogo),
                              height: MediaQuery.of(context).size.height * .2,
                              width: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            Text(
                              "Enter your mobile number".tr,
                              style: getBoldTextStyle(
                                  color: ColorsManger.darkGrey,
                                  fontSize: AppSize.size20),
                            ),
                            Form(
                                child: Column(
                              children: [
                                IntlPhoneField(
                                  autovalidateMode: AutovalidateMode.always,
                                  controller: controller.phone,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    String pattern = r'^01[0-2,5]{1}[0-9]{8}$';
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.completeNumber.length != 11) {
                                      return 'Please enter mobile number'.tr;
                                    } else if (!regExp.hasMatch(value.number)) {
                                      return 'Please enter valid mobile number'
                                          .tr;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Phone number".tr,
                                      focusedBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      fillColor:
                                          Colors.grey.shade50.withOpacity(.5),
                                      filled: true,
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  initialCountryCode: 'EG',
                                  onChanged: (phone) {
                                    controller.otp.text = phone.completeNumber;
                                  },
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 40, bottom: 5),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.size12)),
                                              backgroundColor:
                                                  ColorsManger.primary,
                                              minimumSize: Size(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  64)),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              controller.verifyPhone("+20" +
                                                  controller.phone.text);
                                              // Get.to(OtpLoginVerify());
                                            } else {
                                              Get.snackbar(
                                                  "Phone not valid".tr,
                                                  "Please enter a valid Egyptian phone number"
                                                      .tr,
                                                  icon: Icon(Icons.error,
                                                      color: Colors.red),
                                                  colorText: Colors.red);
                                            }
                                          },
                                          child: Text(
                                            "Next",
                                            style: getBoldTextStyle(
                                                color: ColorsManger.white,
                                                fontSize: AppSize.size20),
                                          ),
                                        ))),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
