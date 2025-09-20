import 'package:admin_campus_navigation/framework/controllers/add_category_controller.dart';
import 'package:admin_campus_navigation/framework/repository/add_category/model/add_category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addCategoryProvider =
    AsyncNotifierProvider<AddCategoryController, AddCategoryModel>(
      AddCategoryController.new,
    );
