import 'package:admin_campus_navigation/framework/repository/all_categories/contract/all_categories_contract.dart';
import 'package:admin_campus_navigation/framework/repository/all_categories/model/all_categories_model.dart';
import 'package:dio/dio.dart';

import '../../../providers/network/dio/dio_client.dart';
import '../../../providers/network/endpoints/api_endpoints.dart';

class AllCategoriesRepo implements AllCategoriesContract {
  DioClient dioClient = DioClient();

  @override
  Future<AllCategoriesModel> getAllDefaultCategories() async {
    try {
      var response = await dioClient.get(ApiEndpoints.allDefaultCategories);

      if (response.statusCode == 200) {
        return AllCategoriesModel.fromJson(response.data);
      } else {
        throw Exception('Something went wrong');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AllCategoriesModel> getAllCustomCategories() async {
    try {
      var response = await dioClient.get(ApiEndpoints.allCustomCategories);

      if (response.statusCode == 200) {
        if (AllCategoriesModel.fromJson(response.data).status == 400) {
          return AllCategoriesModel.fromJson({'status': 400, 'message': []});
        } else {
          return AllCategoriesModel.fromJson(response.data);
        }
      } else {
        throw Exception('Something went wrong');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
