import 'package:admin_campus_navigation/framework/providers/network/endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioClient{

  final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl,connectTimeout: Duration(seconds: 15),receiveTimeout: Duration(seconds: 15),sendTimeout: Duration(seconds: 15)));

  DioClient(){
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get(String url) async{
    return await dio.get(url);
  }
}