import 'package:dio/dio.dart';
class Api {
  final Dio dio;
  Api(this.dio);
  Future<dynamic> get({required String url}) async {
    try {
      Response response = await dio.get(url);
     return response.data['articles'];
    } on DioException catch (error) {
      final String errorMessage = error.response?.data['message'] ??
          'opps there was an error,try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw ('there was an error,try later');
    }
  }
}
