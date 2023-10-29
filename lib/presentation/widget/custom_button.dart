import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.backgroundColor = AppTheme.blue1,
      this.textColor = AppTheme.white,
      this.textButton = "Action",
      required this.buttonTap,
      this.widthButton,
      this.borderSide = BorderSide.none,
      this.textStyle});

  final double? widthButton;
  final Color backgroundColor;
  final Color textColor;
  final String textButton;
  final BorderSide borderSide;
  final Function() buttonTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: buttonTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: borderSide,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: textStyle ?? AppTheme.subtitle3().copyWith(color: textColor),
        ),
      ),
    );
  }
}

class CustomButtonRed extends StatelessWidget {
  const CustomButtonRed({
    super.key,
    this.textButton = "Action",
    required this.buttonTap,
    this.widthButton,
  });

  final double? widthButton;
  final String textButton;
  final Function() buttonTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      widthButton: widthButton ?? MediaQuery.of(context).size.width,
      backgroundColor: AppTheme.red,
      buttonTap: buttonTap,
      textButton: textButton,
    );
  }
}

class CustomButtonWhite extends StatelessWidget {
  const CustomButtonWhite({
    super.key,
    this.textButton = "Action",
    required this.buttonTap,
    this.widthButton,
  });

  final double? widthButton;
  final String textButton;
  final Function() buttonTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      widthButton: widthButton ?? MediaQuery.of(context).size.width,
      backgroundColor: AppTheme.white,
      buttonTap: buttonTap,
      textColor: AppTheme.blackColor,
      borderSide: const BorderSide(color: AppTheme.blackColor2, width: 0.5),
      textButton: textButton,
    );
  }
}

class CustomButtonDisabled extends StatelessWidget {
  const CustomButtonDisabled({
    super.key,
    this.backgroundColor = AppTheme.grayColor,
    this.textButton = "Enter",
    this.widthButton,
    this.textColor = AppTheme.white,
  });

  final Color backgroundColor, textColor;
  final String textButton;
  final double? widthButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthButton ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          textButton,
          style: AppTheme.subtitle3().copyWith(color: AppTheme.white),
        ),
      ),
    );
  }
}
