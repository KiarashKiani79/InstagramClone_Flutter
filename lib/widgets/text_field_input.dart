import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool isPass;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const TextFieldInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.isPass = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        label: Text(label),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}
