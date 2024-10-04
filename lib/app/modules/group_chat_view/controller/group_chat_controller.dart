import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview_task/app/core/model/create_global_chat_model.dart';
import 'package:interview_task/app/core/model/recieve_messages_model.dart';
import 'package:interview_task/app/modules/group_chat_view/repository/group_chat_repository.dart';

class GroupChatController extends GetxController {
  File? imagePath;
  final GroupChatRepository _repository = GroupChatRepository();
  TextEditingController txtSendMessage = TextEditingController();

  RxList recieveChatMessagesList = [].obs;

  @override
  void onInit() {
    recieveChatMessages();
    super.onInit();
  }

  Future<void> recieveChatMessages() async {
    try {
      final response = await _repository.recieveChatMessages();

      RecieveMessagesModel recieveMessagesModel =
          RecieveMessagesModel.fromJson(response);

      for (var element in recieveMessagesModel.data) {
        recieveChatMessagesList.add(element.chatDetails.message);
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
}
