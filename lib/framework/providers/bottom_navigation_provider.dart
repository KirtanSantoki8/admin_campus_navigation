import 'package:admin_campus_navigation/framework/controllers/bottom_navigation_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider =
    NotifierProvider<BottomNavigationController, int>(
      BottomNavigationController.new,
    );
