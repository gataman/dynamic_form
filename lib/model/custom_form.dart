// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_form/model/form_options.dart';

class CustomForm {
  String label; // En üstte özel form alanı labelı için eklendi.
  String? description; // Alan tanımlayıcı
  int? categoryId; // Kategoride ne olacak bilinmiyor
  int type; // Alan tipi için
  List<FormOption>? optionList; // Alan tipi opsiyonsa doldurulacak
  String? formName;

  CustomForm({required this.label, this.description, this.categoryId, this.type = 1, this.optionList, this.formName});

  @override
  String toString() {
    return 'CustomForm(label: $label, description: $description, categoryId: $categoryId, type: $type, optionList: $optionList, formName: $formName)';
  }
}
