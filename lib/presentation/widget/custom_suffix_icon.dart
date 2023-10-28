import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon(
      {super.key,
      required this.onTap,
      required this.obscureText,
      this.iconHideText,
      this.iconShowText});

  final Function() onTap;
  final bool obscureText;
  final Widget? iconHideText, iconShowText;

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return Container(
        margin: const EdgeInsets.only(right: 16),
        child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onTap,
            color: AppTheme.white,
            icon: const Icon(
              Icons.visibility_off_outlined,
              color: AppTheme.blackColor2,
            )),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(right: 16),
        child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onTap,
            color: AppTheme.white,
            icon: const Icon(
              Icons.visibility_outlined,
              color: AppTheme.blackColor2,
            )),
      );
    }
  }
}
