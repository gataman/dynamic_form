import 'package:flutter/material.dart';

class OptionTextFormField extends StatelessWidget {
  const OptionTextFormField({
    super.key,
    this.controller,
    required this.label,
  });

  final TextEditingController? controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(label),
            prefix: Checkbox(
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
      ),
    );
  }
}
