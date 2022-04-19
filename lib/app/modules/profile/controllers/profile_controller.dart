import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  XFile? profileImage;
  TextEditingController status = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String countryFlag="";
}
