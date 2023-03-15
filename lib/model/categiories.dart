// ignore_for_file: public_member_api_docs, sort_constructors_first
class Categories {
  int id;
  String categoryName;
  Categories({
    required this.id,
    required this.categoryName,
  });

  @override
  String toString() => 'Categories(id: $id, categoryName: $categoryName)';
}
