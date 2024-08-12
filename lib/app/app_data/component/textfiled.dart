import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
   final bool? isBorder;
  const CustomTextFormField({
    super.key,
    required this.controller,
     this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
     
       border: (isBorder ?? false) ? InputBorder.none : null,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        
        
        
        //  OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
      ),
      validator: validator,
    );
  }
}
