import 'package:admin_campus_navigation/framework/repository/add_category/model/add_category_model.dart';

abstract class AddCategoryContract {
  Future<AddCategoryModel> addCategory(String categoryName, String image);
}