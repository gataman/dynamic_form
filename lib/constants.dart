import 'package:dynamic_form/enums/custom_form_types.dart';
import 'package:dynamic_form/model/categiories.dart';

import 'model/custom_form.dart';

final categoryList = List.generate(3, (index) => Categories(id: index, categoryName: 'Kategori ${index + 1}'));

final List<String> catList = ['Kategori 1', 'Kategori 2', 'Kategori 3'];

final List<CustomForm> customFormList = List.generate(
  2,
  (index) => CustomForm(
    id: index + 1,
    description: 'Input_bla_bla',
    categoryId: 1,
  ),
);
