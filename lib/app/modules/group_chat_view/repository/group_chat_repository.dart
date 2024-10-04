import 'package:dio/dio.dart';
import 'package:interview_task/app/core/model/create_global_chat_model.dart';
import 'package:interview_task/app/data/remote/api_endpoints.dart';
import 'package:interview_task/app/data/remote/network/dio_provider.dart';

class GroupChatRepository {
  static final GroupChatRepository _instance = GroupChatRepository._internal();
  final Dio _dioClient = DioProvider.getHttpClient(requiresToken: true);

  factory GroupChatRepository() {
    return _instance;
  }

  GroupChatRepository._internal();

  Future<dynamic> recieveChatMessages() async {
    try {
      final response = await _dioClient.get(
        ApiEndPoints.showGlobalChat,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'AuthToken': '2ec26ad9-e039-445e-915e-a482dc6f5e3b'
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw Exception('An error occurred while fetching avatar: $e');
    }
  }

  Future<dynamic> createGlobalChat(
      CreateGlobalChatModel createGlobalChatModel) async {
    try {
      final response = await _dioClient.post(
        ApiEndPoints.createGlobalChat,
        data: createGlobalChatModel,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'AuthToken': '2ec26ad9-e039-445e-915e-a482dc6f5e3b'
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw Exception('An error occurred while fetching avatar: $e');
    }
  }

  Future<dynamic> showGlobalUser(String emailId) async {
    try {
      final response = await _dioClient.post(
        ApiEndPoints.showGlobalUser,
        data: {
          'email': emailId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'AuthToken': '2ec26ad9-e039-445e-915e-a482dc6f5e3b'
          },
        ),
      );
      return response.data;
    } catch (e) {
      throw Exception('An error occurred while fetching global user: $e');
    }
  }
}
