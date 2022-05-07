import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toplive/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/values_manger.dart';

class ProfileImage extends GetWidget<ProfileController> {
  const ProfileImage(this.imageUrl, {Key? key}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        controller.profileImage = await ImagePicker().pickImage(
            source: ImageSource.gallery,
            preferredCameraDevice: CameraDevice.front);
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.size20 * 5),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
