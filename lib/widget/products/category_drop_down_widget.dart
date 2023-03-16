import 'package:flutter/material.dart';

import '../../constants.dart';

import '../../model/form_category.dart';

class CategoryDropDownWidget extends StatefulWidget {
  const CategoryDropDownWidget({super.key, required this.onChanged});
  final ValueChanged<FormCategory> onChanged;

  @override
  State<CategoryDropDownWidget> createState() => _CategoryDropDownWidgetState();
}

class _CategoryDropDownWidgetState extends State<CategoryDropDownWidget> {
  FormCategory? defaultValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<FormCategory>(
        value: defaultValue,
        decoration: const InputDecoration(
          label: Text('Alan Veri Kategorisi'),
        ),
        style: const TextStyle(color: Colors.black),
        isExpanded: false,
        menuMaxHeight: 200,
        items: categoryList
            .map<DropdownMenuItem<FormCategory>>(
              (e) => DropdownMenuItem<FormCategory>(
                value: e,
                child: Text(e.categoryName),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            widget.onChanged(value);
          }

          setState(() {
            defaultValue = value;
          });
        },
      ),
    );
  }
}
