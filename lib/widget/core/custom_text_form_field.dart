import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.label,
    required this.onChanged,
    this.initialValue,
  });

  final TextEditingController? controller;
  final String label;
  final Function(String value) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
