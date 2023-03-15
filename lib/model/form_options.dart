// ignore_for_file: public_member_api_docs, sort_constructors_first
class FormOptions {
  int? id;
  int formTypeId;
  String? value;
  bool isChecked;

  FormOptions({
    this.id,
    required this.formTypeId,
    this.isChecked = false,
    this.value,
  });
}
