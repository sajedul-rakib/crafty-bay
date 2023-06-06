import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    super.key,
    this.hintText,
    this.maxLine,
    this.suffixIcon,
    this.textEditingController,
    this.validator,
    this.keyBoardType, this.isReadable=false,
  });

  final String? hintText;
  final int? maxLine;
  final IconData? suffixIcon;
  final TextEditingController? textEditingController;
  final Function(String?)? validator;
  final TextInputType? keyBoardType;
  final bool isReadable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (validator != null) {
          return validator!(value);
        } else {
          return null;
        }
      },
      keyboardType: keyBoardType,
      controller: textEditingController,
      readOnly: isReadable,
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
          prefixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500),
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: primaryColor),
              borderRadius: BorderRadius.circular(4))),
    );
  }
}
