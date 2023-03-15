import 'package:dynamic_form/constants.dart';
import 'package:dynamic_form/enums/custom_form_types.dart';
import 'package:dynamic_form/model/custom_form.dart';
import 'package:dynamic_form/widget/products/form_types_drop_down_widget.dart';
import 'package:flutter/material.dart';

import '../products/category_drop_down_widget.dart';
import 'custom_text_form_field.dart';
import 'option_text_form_field.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key, required this.customForm});
  final CustomForm customForm;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    debugPrint('liste ${categoryList.length}');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Row(
          children: const [
            Expanded(
              child: Text('Özel Form 01'),
            ),
            Icon(Icons.delete),
          ],
        ),
        children: [
          Form(
            child: Column(
              children: [
                const CustomTextFormField(
                  label: 'Alan Tanımlayıcı  ',
                ),
                const CategoryDropDownWidget(),
                FormTypesDropDownWidget(
                  onChanged: (formType) {
                    setState(() {
                      widget.customForm.type = formType;
                    });
                  },
                ),
                _langsRow(),
                _OptionWidget(
                  formType: widget.customForm.type ?? 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _langsRow() {
    return Row(
      children: [
        TextButton(onPressed: () {}, child: Text('TR')),
        TextButton(onPressed: () {}, child: Text('EN')),
        TextButton(onPressed: () {}, child: Text('FR')),
        TextButton(onPressed: () {}, child: Text('ES')),
        TextButton(onPressed: () {}, child: Text('RU')),
        TextButton(onPressed: () {}, child: Text('DE')),
        TextButton(onPressed: () {}, child: Text('IT')),
        TextButton(onPressed: () {}, child: Text('AR')),
      ],
    );
  }
}

class _OptionWidget extends StatelessWidget {
  const _OptionWidget({
    required this.formType,
  });

  final int formType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(label: 'Alan İsmi  '),
        _getOptions(CustomFormTypes.values.firstWhere((element) => element.type == formType)),
      ],
    );
  }

  Widget _getOptions(CustomFormTypes formType) {
    switch (formType) {
      case CustomFormTypes.singleOptional:
        return _singleOptional();
      case CustomFormTypes.multiOptional:
        return _multiOptional();
      case CustomFormTypes.singleLine:
        return _singleLine();
      case CustomFormTypes.multiLine:
        return _multiLine();
    }
  }

  Widget _singleOptional() {
    return OptionTextFormField(label: 'A Seçeneği ');
  }

  Widget _multiOptional() {
    return const Text('Multi Optional');
  }

  Widget _singleLine() {
    return const Text('Single Line');
  }

  Widget _multiLine() {
    return const Text('Multi Line');
  }
}
