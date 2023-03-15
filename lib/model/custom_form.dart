// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomForm {
  int id;
  String? description;
  int? categoryId;
  int? type;

  CustomForm({required this.id, this.description, this.categoryId, this.type = 1});
}
