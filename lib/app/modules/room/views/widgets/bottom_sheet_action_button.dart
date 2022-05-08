import 'package:flutter/material.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';

class BottomSheetActionButton extends StatelessWidget {
  const BottomSheetActionButton({
    Key? key,
    required this.image,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: getBoldTextStyle(
                color: ColorsManger.white, fontSize: FontSize.xxlarge),
          ),
        ],
      ),
    );
  }
}
