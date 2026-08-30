import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final String? obscureCharacter;
  final TextInputType? inputType;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.isObscure = false,
    this.obscureCharacter,
    this.inputType,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.labelMedium,
      validator: validator,
      obscureText: isObscure,
      obscuringCharacter: obscureCharacter ?? '*',
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
