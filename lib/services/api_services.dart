import 'package:dio/dio.dart';
import 'user_model.dart';

class ApiServices {
  final Dio _dio;

  ApiServices()
      : _dio = Dio(
          BaseOptions(
            baseUrl: "https://api.escuelajs.co/api/v1/users",
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

  Future<UserModel> getUser(int id) async {
    try {
      final response = await _dio.get("/$id");
      return UserModel.fromJson(response.data);
    } on DioException catch (dioError) {
      print('DioError: ${dioError.message}');
      rethrow;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
