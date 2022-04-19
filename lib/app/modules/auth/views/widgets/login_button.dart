import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.backgroundColor,
    required this.asset,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
  }) : super(key: key);
  final Color backgroundColor;
  final Color foregroundColor;
  final String asset;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding18, vertical: AppPadding.padding8),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.size12),
          ),
          minimumSize: Size(double.infinity, 48),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 5),
            Image.asset(asset),
            const SizedBox(width: 20),
            Center(
              child: Text(text,
                  style: getBoldTextStyle(
                    color: foregroundColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
