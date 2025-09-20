import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/dashboard_controller.dart';
import '../repository/dasboard/model/dashboard_model.dart';

final dashboardProvider =
    AsyncNotifierProvider<DashboardController, DashboardModel>(
      DashboardController.new,
    );
