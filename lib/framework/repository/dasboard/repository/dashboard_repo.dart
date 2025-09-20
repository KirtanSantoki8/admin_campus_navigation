import 'package:admin_campus_navigation/framework/providers/network/dio/dio_client.dart';
import 'package:admin_campus_navigation/framework/repository/dasboard/model/dashboard_model.dart';
import 'package:dio/dio.dart';

import '../../../providers/network/endpoints/api_endpoints.dart';
import '../contract/dashboard_contract.dart';

class DashboardRepo implements DashboardContract{

  DioClient dioClient = DioClient();

  @override
  Future<DashboardModel> getDashboardData() async {
    try{
      var response = await dioClient.get(ApiEndpoints.dashboard);

      if(response.statusCode == 200){
        return DashboardModel.fromJson(response.data);
      }else{
        throw Exception('Something went wrong');
      }
    }
    on DioException catch (e){
      throw Exception(e.message);
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}