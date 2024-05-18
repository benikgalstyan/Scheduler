import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    this.onTap,
    this.height,
    this.hintText,
    this.onChanged,
    this.labelText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
  });

  final double? height;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  final borderColor = Colors.grey;
  final borderRadius = BorderRadius.circular(5.0);
  static const textPadding = EdgeInsets.only(left: 8.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: textPadding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: borderColor),
      ),
      child: TextField(
        onTap: onTap,
        maxLines: null,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
