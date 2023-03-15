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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Özel Form Alanı'),
    );
  }

  Widget _addButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            customFormList.add(CustomForm(id: customFormList.length));
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Özel Form Alanı Ekle'),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomExpansionTile(
          customForm: customFormList[index],
        );
      },
      itemCount: customFormList.length,
    );
  }
}
