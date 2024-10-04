import 'package:dio/dio.dart';
import 'package:interview_task/app/core/model/create_global_user_model.dart';
import 'package:interview_task/app/data/remote/api_endpoints.dart';
import 'package:interview_task/app/data/remote/network/dio_provider.dart';

class SignUpRepository {
  static final SignUpRepository _instance = SignUpRepository._internal();
  final Dio _dioClient = DioProvider.getHttpClient(requiresToken: true);

  factory SignUpRepository() {
    return _instance;
  }

  SignUpRepository._internal();

  Future<dynamic> createGlobalUser(
      CreateGlobalUserModel createGlobalUserModel) async {
    try {
      final response = await _dioClient.post(
        ApiEndPoints.createGlobalUser,
        data: createGlobalUserModel,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'AuthToken': '2ec26ad9-e039-445e-915e-a482dc6f5e3b'
          },
        ),
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to create global user');
      }

      return response.data;
    } catch (e) {
      throw Exception('An error occurred while fetching avatar: $e');
    }
  }
}
