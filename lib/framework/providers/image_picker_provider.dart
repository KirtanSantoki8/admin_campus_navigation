import 'package:admin_campus_navigation/framework/controllers/image_picker_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagePickerProvider = NotifierProvider<ImagePickerController, String>(
  ImagePickerController.new,
);
