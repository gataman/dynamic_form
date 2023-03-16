import 'package:flutter/material.dart';

import '../../enums/custom_form_types.dart';
import '../../extensions/iterable_extensions.dart';
import '../../model/custom_form.dart';
import '../../model/form_options.dart';
import '../products/category_drop_down_widget.dart';
import '../products/form_types_drop_down_widget.dart';
import 'custom_text_form_field.dart';
import 'option_text_form_field.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.customForm,
    required this.onDeleteForm,
  });
  final CustomForm customForm;
  final VoidCallback onDeleteForm;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Row(
          children: [
            Expanded(
              child: Text(widget.customForm.label),
            ),
            IconButton(onPressed: widget.onDeleteForm, icon: const Icon(Icons.delete)),
          ],
        ),
        children: [
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Alan Tanımlayıcı  ',
                  onChanged: (value) {
                    widget.customForm.description = value;
                  },
                ),
                CategoryDropDownWidget(
                  onChanged: (value) {
                    widget.customForm.categoryId = value.id;
                  },
                ),
                FormTypesDropDownWidget(
                  onChanged: (formType) {
                    setState(() {
                      widget.customForm.type = formType;
                    });
                  },
                ),
                _langsRow(), // PageView olacak veya IndexedStack
                _OptionWidget(
                  customForm: widget.customForm,
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

// Opsiyonlar
class _OptionWidget extends StatefulWidget {
  const _OptionWidget({
    required this.customForm,
  });

  final CustomForm customForm;

  @override
  State<_OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<_OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          initialValue: widget.customForm.formName,
          label: 'Alan İsmi',
          onChanged: (value) {
            widget.customForm.formName = value;
          },
        ),
        _getOptions(CustomFormTypes.values.firstWhere((element) => element.type == widget.customForm.type)),
        TextButton.icon(
            onPressed: () {
              _addOption();
            },
            icon: Icon(Icons.add),
            label: Text('Opsiyon Ekle'))
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
    if (widget.customForm.optionList != null && widget.customForm.optionList!.isNotEmpty) {
      return Column(
        children: widget.customForm.optionList!
            .map((option) => OptionTextFormField(
                  formOption: option,
                  onChanged: (value) {
                    option.value = value;
                  },
                  onDeleteOption: () {
                    _deleteOption(option);
                  },
                  onChecked: (value) {
                    setState(() {
                      option.isChecked = value;
                    });
                  },
                ))
            .toList(),
      );
    }

    return const SizedBox.shrink();
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

  void _addOption() {
    setState(() {
      widget.customForm.optionList ??= [];
      final index = widget.customForm.optionList!.length + 1;
      widget.customForm.optionList!.add(FormOption(
        label: 'Opsiyon $index',
      ));
    });
  }

  void _deleteOption(FormOption formOptions) {
    setState(() {
      widget.customForm.optionList?.remove(formOptions);
      _setOptionsIndex();
    });
  }

  void _setOptionsIndex() {
    setState(() {
      widget.customForm.optionList?.forEachIndexed((index, element) {
        element.index = index + 1;
        element.label = 'Opsiyon ${index + 1}';
      });
    });
  }
}
