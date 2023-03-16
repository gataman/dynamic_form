import 'package:dynamic_form/model/form_category.dart';

final categoryList = List.generate(3, (index) => FormCategory(id: index + 1, categoryName: 'Kategori ${index + 1}'));

final List<String> catList = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
