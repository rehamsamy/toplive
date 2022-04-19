import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toplive/app/modules/auth/controllers/auth_controller.dart';

import 'package:flutter/services.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';

class VerifyCodePage extends StatefulWidget {
  VerifyCodePage({Key? key}) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final AuthController controller = Get.find();
  final RxString _comingSms = 'Unknown'.obs;

  Future<void> initSmsListener() async {
    String? comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }

    _comingSms.value = comingSms!;
    controller.otp.text = _comingSms.value[0] +
        _comingSms.value[1] +
        _comingSms.value[2] +
        _comingSms.value[3] +
        _comingSms.value[4] +
        _comingSms.value[5];
    controller.otpVerify(controller.otp.text);
  }

  @override
  void initState() {
    initSmsListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.assetsImagesWhiteBackground))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: controller.phone.text,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  //key: formKey,
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade200,
                      selectedColor: Colors.grey.shade200,
                      selectedFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      activeColor: Colors.grey.shade200),
                  cursorColor: ColorsManger.primary,
                  textStyle: getBoldTextStyle(),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: false,
                  controller: controller.otp,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    //do something or move to next screen when code complete
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      print(value);
                    });
                  },
                ),
              )),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () async {
                      controller.otpVerify(controller.otp.text);
                    },
                    child: Center(
                        child: Text(
                      "VERIFY".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          offset: Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          offset: Offset(-1, 2),
                          blurRadius: 5)
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
