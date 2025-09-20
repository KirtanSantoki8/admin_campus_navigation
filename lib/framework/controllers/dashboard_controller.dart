import 'dart:async';

import 'package:admin_campus_navigation/framework/repository/dasboard/model/dashboard_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/dasboard/repository/dashboard_repo.dart';

class DashboardController extends AsyncNotifier<DashboardModel>{

  @override
  FutureOr<DashboardModel> build() async {
    final data = await DashboardRepo().getDashboardData();
    return data;
  }

  Future<void> getDashboardData() async{
    state = const AsyncValue.loading();
    try{
      final data = await DashboardRepo().getDashboardData();
      state = AsyncValue.data(data);
    }catch(e){
      state = AsyncValue.error(e.toString(),StackTrace.current);
    }
  }

}