import 'package:dynamic_form/model/form_options.dart';
import 'package:flutter/material.dart';

class OptionTextFormField extends StatelessWidget {
  const OptionTextFormField({
    super.key,
    this.controller,
    required this.formOption,
    required this.onDeleteOption,
    required this.onChanged,
    required this.onChecked,
  });

  final TextEditingController? controller;
  final FormOption formOption;
  final VoidCallback onDeleteOption;
  final Function(String value) onChanged;
  final Function(bool value) onChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
              label: Text(formOption.label),
              prefixIcon: SizedBox(
                height: double.infinity,
                child: Checkbox(
                  onChanged: (value) {
                    if (value != null) {
                      onChecked(value);
                    }
                  },
                  value: formOption.isChecked,
                ),
              ),
              suffixIcon: IconButton(icon: const Icon(Icons.delete), onPressed: onDeleteOption)),
        ),
      ),
    );
  }
}
