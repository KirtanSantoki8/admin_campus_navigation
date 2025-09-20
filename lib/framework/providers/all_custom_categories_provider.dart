import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/all_custom_categories_controller.dart';
import '../repository/all_categories/model/all_categories_model.dart';

final allCustomCategoriesProvider =
AsyncNotifierProvider<AllCustomCategoriesController, AllCategoriesModel>(
  AllCustomCategoriesController.new,
);