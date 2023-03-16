import 'package:dynamic_form/extensions/iterable_extensions.dart';
import 'package:flutter/material.dart';

import 'model/custom_form.dart';

import 'widget/core/custom_expansion_tile.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final List<CustomForm> customFormList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (customFormList.isNotEmpty) _title(),
        if (customFormList.isNotEmpty) Expanded(child: _listView()),
        _addButton(),
      ],
    );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(child: Text('Özel Form Alanı')),
          ElevatedButton(
              onPressed: () {
                debugPrint(customFormList.toString());
              },
              child: const Text('Kaydet'))
        ],
      ),
    );
  }

  // Özel form list view
  Widget _listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final customForm = customFormList[index];
        return CustomExpansionTile(
          customForm: customForm,
          onDeleteForm: () {
            _deleteForm(customForm);
          },
        );
      },
      itemCount: customFormList.length,
    );
  }

  // Yeni özel form ekleme
  Widget _addButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            final count = customFormList.length + 1;
            final String label = count < 10 ? 'Özel Form 0$count' : 'Özel Form $count';
            customFormList.add(CustomForm(label: label));
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Özel Form Alanı Ekle'),
      ),
    );
  }

  void _deleteForm(CustomForm customForm) {
    setState(() {
      customFormList.remove(customForm);
      _setFormName();
    });
  }

  // Özel form alanı silindiğinde isimlendirmedeki 01, 02... vb değişecekse diye eklendi.
  void _setFormName() {
    customFormList.forEachIndexed((index, element) {
      final count = index + 1;
      String label = count < 10 ? 'Özel Form 0$count' : 'Özel Form $count';

      element.label = label;
    });
  }
}
