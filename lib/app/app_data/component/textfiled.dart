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
        
        
  
      ),
      validator: validator,
    );
  }
}



class SearchTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final FormFieldValidator<String>? validator;
  final VoidCallback? filter;

  const SearchTextFormField({
    super.key,
    required this.controller,
    this.filter,
    this.hintText = 'Search...',
    this.onChanged,
    this.onClear,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
              splashRadius: 20,
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  if (onClear != null) {
                    onClear!();
                  }
                },
              )
            : IconButton(
               splashRadius: 20,
                icon: const Icon(Icons.tune),
                onPressed: filter
              ),
     
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
