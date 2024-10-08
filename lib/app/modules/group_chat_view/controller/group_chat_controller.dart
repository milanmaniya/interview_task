import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview_task/app/core/model/create_global_chat_model.dart';
import 'package:interview_task/app/core/model/recieve_messages_model.dart';
import 'package:interview_task/app/core/model/show_global_user_model.dart';
import 'package:interview_task/app/core/utils/shared_preference.dart';
import 'package:interview_task/app/modules/group_chat_view/repository/group_chat_repository.dart';
import 'package:interview_task/app/modules/group_chat_view/widgets/chat_container.dart';
import 'package:intl/intl.dart';

class GroupChatController extends GetxController {
  File? imagePath;
  final GroupChatRepository _repository = GroupChatRepository();
  TextEditingController txtSendMessage = TextEditingController();

  RxList messageList = [].obs;

  RxString userId = ''.obs;
  RxString userName = ''.obs;

  RxBool showEmoji = false.obs;

  late ShowGlobalUserModel showGlobalUserModel;

  @override
  void onInit() async {
    final data = await SharedPreferenceService().getEmail();

    showGlobalUserModel = await showGlobalUser(data.toString());
    recieveChatMessages();
    super.onInit();
  }

  Future<void> recieveChatMessages() async {
    try {
      final response = await _repository.recieveChatMessages();

      ReceiveMessageModel recieveMessagesModel =
          ReceiveMessageModel.fromJson(response);

      for (var element in recieveMessagesModel.data) {
        for (var ele in element.userDetails) {
          messageList.add(
            ChatContainer(
              userName: ele.name,
              time: DateFormat.jm().format(
                DateTime.parse(
                  element.createdAt.toString(),
                ),
              ),
              message: element.message.toString(),
            ),
          );
        }
      }
    } catch (e) {
      throw Exception('Failed to create global user');
    }
  }

  Future<void> createGlobalChat(
      CreateGlobalChatModel createGlobalChatModel) async {
    try {
      final response =
          await _repository.createGlobalChat(createGlobalChatModel);

      if (response['status'] == 'true') {
        txtSendMessage.clear();
      }

      messageList.add(ChatContainer(
          isSend: true,
          userName: 'you',
          time:
              DateFormat.jm().format(DateTime.parse(DateTime.now().toString())),
          message: createGlobalChatModel.message));
    } catch (e) {
      throw Exception('Failed to create global user');
    }
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = File(image.path);
    }
  }

  Future<ShowGlobalUserModel> showGlobalUser(String emailId) async {
    try {
      final response = await _repository.showGlobalUser(emailId);

      ShowGlobalUserModel showGlobalUserModel =
          ShowGlobalUserModel.fromJson(response);

      userId.value = showGlobalUserModel.data[0].id.toString();
      userName.value = showGlobalUserModel.data[0].name.toString();

      return showGlobalUserModel;
    } catch (e) {
      throw Exception('Failed to show global user');
    }
  }
}
