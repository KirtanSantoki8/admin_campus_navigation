import 'dart:async';

import 'package:admin_campus_navigation/framework/providers/image_picker_provider.dart';
import 'package:admin_campus_navigation/framework/repository/add_category/model/add_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/add_category/repository/add_category_repo.dart';

class AddCategoryController extends AsyncNotifier<AddCategoryModel> {
  TextEditingController categoryNameController = TextEditingController();

  @override
  FutureOr<AddCategoryModel> build() {
    return Future.value(AddCategoryModel());
  }

  Future<void> addCategory() async {
    state = AsyncValue.loading();
    try {
      var data = await AddCategoryRepo().addCategory(
        categoryNameController.text,
        ref.read(imagePickerProvider),
      );
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
