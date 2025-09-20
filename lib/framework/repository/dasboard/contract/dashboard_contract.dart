import '../model/dashboard_model.dart';

abstract class DashboardContract{
  Future<DashboardModel> getDashboardData();
}