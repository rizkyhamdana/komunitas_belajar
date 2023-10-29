import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.titleText,
    this.hintText,
    this.labelText,
    required this.textFieldController,
    this.textInputType,
    this.onChanged,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autoFocus = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscuringCharacter = '•',
    this.validator,
    this.minLines,
    this.maxLines,
    this.floatingLabelBehavior,
  });

  final String? titleText;
  final String? hintText;
  final String? labelText;
  final TextEditingController textFieldController;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autoFocus;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final FormFieldValidator<String?>? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText!, style: AppTheme.body1()),
                  verticalSpacing(
                    10,
                  ),
                ],
              )
            : Container(),
        TextFormField(
          controller: textFieldController,
          autofocus: autoFocus,
          obscureText: obscureText,
          keyboardType: textInputType,
          obscuringCharacter: obscuringCharacter,
          enabled: enabled,
          readOnly: readOnly,
          onChanged: onChanged,
          textInputAction: textInputAction,
          minLines: minLines,
          maxLines: maxLines,
          style: AppTheme.textFieldStyle(),
          validator: validator,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            filled: true,
            fillColor: AppTheme.white,
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 28, maxWidth: 36),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            suffixIcon: suffixIcon,
            labelText: labelText,
            hintText: hintText,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide(color: AppTheme.blackShadow, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              // borderSide: BorderSide(color: HexColor('#BDBDBD'), width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide(color: AppTheme.blackShadow, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              // borderSide: BorderSide(color: HexColor('#BDBDBD'), width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide(color: AppTheme.red, width: 0),
            ),
            errorStyle: AppTheme.body3(color: AppTheme.red),
            disabledBorder: InputBorder.none,
            hintStyle: AppTheme.textFieldStyle(color: AppTheme.blackColor2),
            labelStyle: AppTheme.textFieldStyle(color: AppTheme.blackColor2),
          ),
        ),
      ],
    );
  }
}
