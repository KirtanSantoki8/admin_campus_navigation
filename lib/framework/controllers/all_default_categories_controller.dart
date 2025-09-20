import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/all_categories/model/all_categories_model.dart';
import '../repository/all_categories/repository/all_categories_repo.dart';

class AllCategoriesController extends AsyncNotifier<AllCategoriesModel>{
  @override
  FutureOr<AllCategoriesModel> build() async {
    var data = await AllCategoriesRepo().getAllDefaultCategories();
    return data;
  }

  Future<void> getAllCategories() async{
    state = const AsyncValue.loading();
    try{
      var data = await AllCategoriesRepo().getAllDefaultCategories();
      state = AsyncValue.data(data);
    }catch(e){
      state = AsyncValue.error(e.toString(),StackTrace.current);
    }
  }

}