import 'package:dynamic_form/constants.dart';
import 'package:dynamic_form/model/categiories.dart';
import 'package:flutter/material.dart';

class CategoryDropDownWidget extends StatefulWidget {
  const CategoryDropDownWidget({super.key});

  @override
  State<CategoryDropDownWidget> createState() => _CategoryDropDownWidgetState();
}

class _CategoryDropDownWidgetState extends State<CategoryDropDownWidget> {
  Categories? defaultValue;

  @override
  Widget build(BuildContext context) {
    debugPrint(categoryList.toString());
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<Categories>(
        value: defaultValue,
        decoration: const InputDecoration(
          label: Text('Alan Veri Kategorisi'),
        ),
        style: const TextStyle(color: Colors.black),
        isExpanded: false,
        menuMaxHeight: 200,
        items: categoryList
            .map<DropdownMenuItem<Categories>>(
              (e) => DropdownMenuItem<Categories>(
                value: e,
                child: Text(e.categoryName),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            defaultValue = value;
          });
        },
      ),
    );
  }
}
