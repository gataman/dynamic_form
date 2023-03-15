// ignore_for_file: public_member_api_docs, sort_constructors_first
class FormType {
  int? id;
  String? name;
  String formID;
  int type;
  FormType({
    this.id,
    this.name,
    required this.formID,
    this.type = 1,
  });
}
