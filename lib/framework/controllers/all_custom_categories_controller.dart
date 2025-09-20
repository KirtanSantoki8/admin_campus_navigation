import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/all_categories/model/all_categories_model.dart';
import '../repository/all_categories/repository/all_categories_repo.dart';

class AllCustomCategoriesController extends AsyncNotifier<AllCategoriesModel> {
  @override
  FutureOr<AllCategoriesModel> build() async {
    print('build');
    var data = await AllCategoriesRepo().getAllCustomCategories();
    return data;
  }

  Future<void> getAllCategories() async {
    state = const AsyncValue.loading();
    try {
      var data = await AllCategoriesRepo().getAllCustomCategories();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}