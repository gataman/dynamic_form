// ignore_for_file: public_member_api_docs, sort_constructors_first
class FormOption {
  int index;
  String label; // Option
  String? value;
  bool isChecked;

  FormOption({
    required this.label,
    this.index = 0,
    this.isChecked = false,
    this.value,
  });

  @override
  String toString() {
    return 'FormOptions(index: $index, label: $label, value: $value, isChecked: $isChecked)';
  }
}
