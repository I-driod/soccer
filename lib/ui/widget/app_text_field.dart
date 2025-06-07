import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.errorText,
    this.suffixIcon,

    this.isPasswordVisible,
    this.onChanged,
    this.labelText,
  });

  final String? errorText;
  final Widget? suffixIcon;

  final bool? isPasswordVisible;
  final Function(String)? onChanged;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorText: errorText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        suffixIcon: suffixIcon,
      ),

      enableSuggestions: false,
      autocorrect: false,
      obscuringCharacter: '●',
      obscureText: isPasswordVisible ?? false,

      onChanged: onChanged,
    );
  }
}
