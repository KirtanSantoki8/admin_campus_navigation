import 'package:admin_campus_navigation/framework/repository/all_categories/model/all_categories_model.dart';

abstract class AllCategoriesContract{
  Future<AllCategoriesModel> getAllDefaultCategories();
  Future<AllCategoriesModel> getAllCustomCategories();
}