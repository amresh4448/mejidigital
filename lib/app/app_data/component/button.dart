import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color? iconColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.white),
              SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle ?? TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
