import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  Icon icon;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool obscureText;
  CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label, icon: icon),
    );
  }
}
