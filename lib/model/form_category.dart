class FormCategory {
  int id;
  String categoryName;
  FormCategory({
    required this.id,
    required this.categoryName,
  });

  @override
  String toString() => 'Categories(id: $id, categoryName: $categoryName)';
}
