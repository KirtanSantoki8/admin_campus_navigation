import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagePickerController extends Notifier<String>{
  @override
  String build() {
    return '';
  }

  void pickImage(String image){
    state = image;
  }

}