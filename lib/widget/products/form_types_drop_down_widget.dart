import 'package:dynamic_form/constants.dart';
import 'package:dynamic_form/enums/custom_form_types.dart';
import 'package:dynamic_form/model/form_category.dart';
import 'package:flutter/material.dart';

class FormTypesDropDownWidget extends StatefulWidget {
  const FormTypesDropDownWidget({super.key, required this.onChanged});

  final ValueChanged<int> onChanged;

  @override
  State<FormTypesDropDownWidget> createState() => _FormTypesDropDownWidgetState();
}

class _FormTypesDropDownWidgetState extends State<FormTypesDropDownWidget> {
  CustomFormTypes? defaultValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<CustomFormTypes>(
        value: defaultValue ?? CustomFormTypes.singleOptional,
        decoration: const InputDecoration(
          label: Text('Alan Tipi'),
        ),
        style: const TextStyle(color: Colors.black),
        isExpanded: false,
        menuMaxHeight: 200,
        items: CustomFormTypes.values
            .map<DropdownMenuItem<CustomFormTypes>>(
              (e) => DropdownMenuItem<CustomFormTypes>(
                value: e,
                child: Text(e.label),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            defaultValue = value;
            if (value != null) {
              widget.onChanged(value.type);
            }
          });
        },
      ),
    );
  }
}
