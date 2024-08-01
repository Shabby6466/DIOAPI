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

  // Future<Response<T>> request<T>(
  //   String path, {
  //   String method = 'GET',
  //   Object? data,
  //   Map<String, dynamic>? queryParameter,
  //   CancelToken? cancelToken,
  //   Options? options,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onRecieveProgress,
  // }) async {
  //   try {
  //     final response = await _dio.request<T>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameter,
  //       cancelToken: cancelToken,
  //       options: options ?? Options(method: method),
  //       onReceiveProgress: onRecieveProgress,
  //       onSendProgress: onSendProgress,
  //     );
  //     return response;
  //   } on DioException catch (dioError) {
  //     print('DioError: ${dioError.message}');
  //     rethrow;
  //   } catch (e) {
  //     print('Error: $e');
  //     rethrow;
  //   }
  // }
  //
  // Future<UserModel> getUser(int id) async {
  //   try {
  //     final response = await request<UserModel>("/$id",
  //         queryParameter: {'role': 'customer', 'name': 'Jhon'});
  //     return UserModel.fromJson(response.data as Map<String, dynamic>);
  //   } on DioException catch (dioError) {
  //     print('DioError: ${dioError.message}');
  //     rethrow;
  //   } catch (e) {
  //     print('Error: $e');
  //     rethrow;
  //   }
  // }
}
