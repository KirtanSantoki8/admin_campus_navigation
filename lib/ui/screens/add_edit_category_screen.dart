import 'dart:io';

import 'package:admin_campus_navigation/framework/providers/add_category_provider.dart';
import 'package:admin_campus_navigation/framework/providers/image_picker_provider.dart';
import 'package:admin_campus_navigation/ui/utils/common_widets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/common_widets/common_text_field.dart';

class AddEditCategoryScreen extends ConsumerWidget {
  const AddEditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                'Preview',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.file(
                            File(ref.watch(imagePickerProvider)),
                            height: 150,
                            width: constraints.maxWidth * 0.8,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 20),
                          ValueListenableBuilder(
                            valueListenable: ref
                                .read(addCategoryProvider.notifier)
                                .categoryNameController,
                            builder: (context, value, child) {
                              return Text(value.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                onPressed: () async {
                  var image = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    ref
                        .watch(imagePickerProvider.notifier)
                        .pickImage(image.path);
                  }
                },
                child: Text('Pick Image'),
              ),
            ),
            SizedBox(height: 20),
            CommonTextField(
              hintText: 'Category Name',
              labelText: 'Category Name',
              controller: ref
                  .read(addCategoryProvider.notifier)
                  .categoryNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter category name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (ref.watch(imagePickerProvider) == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select image')),
                      );
                      return;
                    } else {
                      ref
                          .read(addCategoryProvider.notifier)
                          .addCategory()
                          .whenComplete(
                            () => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Category added successfully'),
                              ),
                            ),
                          );
                    }
                  }
                },
                child: Text('Add Category'),
              ),
            ),
            SizedBox(height: 20,),
            ref
                .watch(addCategoryProvider)
                .when(
                  data: (data) {
                    return Visibility(
                      visible: false,
                      child: Text(data.message ?? ''),
                    );
                  },
                  error: (error, stackTrace) {
                    return Visibility(
                      visible: false,
                      child: Text(error.toString()),
                    );
                  },
                  loading: () {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
          ],
        ),
      ),
    );
  }
}
