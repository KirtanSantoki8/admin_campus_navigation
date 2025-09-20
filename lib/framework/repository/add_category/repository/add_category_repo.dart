import 'package:admin_campus_navigation/framework/providers/network/dio/dio_client.dart';
import 'package:admin_campus_navigation/framework/providers/network/endpoints/api_endpoints.dart';
import 'package:admin_campus_navigation/framework/repository/add_category/contract/add_category_contract.dart';
import 'package:admin_campus_navigation/framework/repository/add_category/model/add_category_model.dart';
import 'package:dio/dio.dart';

class AddCategoryRepo implements AddCategoryContract{

  DioClient dioClient = DioClient();

  @override
  Future<AddCategoryModel> addCategory(String categoryName, String image) async {
    try{
      var response = await dioClient.postFormData(ApiEndpoints.addCategory, {'location': categoryName,'image': await MultipartFile.fromFile(image)});

      if(response.statusCode == 200){
        return AddCategoryModel.fromJson(response.data);
      }else{
        throw Exception('Something went wrong');
      }
    }on DioException catch(e){
      throw Exception(e.message);
    }catch(e){
      throw Exception(e.toString());
    }
  }

}