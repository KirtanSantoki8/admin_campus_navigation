import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/all_default_categories_controller.dart';
import '../repository/all_categories/model/all_categories_model.dart';

final allDefaultCategoriesProvider =
    AsyncNotifierProvider<AllCategoriesController, AllCategoriesModel>(
      AllCategoriesController.new,
    );
