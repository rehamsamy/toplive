import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/values_manger.dart';

class BottomSheetActionButtonBottom extends StatelessWidget {
  const BottomSheetActionButtonBottom({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.size12),
              color: ColorsManger.white.withOpacity(.1)),
          width: context.width * 0.2,
          child: IconButton(
            icon: icon,
            onPressed: onPressed,
          )),
    );
  }
}
