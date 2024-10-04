import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/model/create_global_chat_model.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';
import 'package:interview_task/app/modules/group_chat_view/controller/group_chat_controller.dart';
import 'package:interview_task/app/modules/group_chat_view/widgets/recieve_chat.dart';

class GroupChatView extends StatefulWidget {
  const GroupChatView({super.key});

  @override
  State<GroupChatView> createState() => _GroupChatViewState();
}

class _GroupChatViewState extends State<GroupChatView> {
  final controller = Get.put(GroupChatController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Group Chat',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, screenHeight * 0.01),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 5),
                child: Text(
                  'Hi, Milam Maniya',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: 80,
          ),
          children: [
            ...List.generate(
              controller.recieveChatMessagesList.length,
              (index) => RecieveChat(
                message: controller.recieveChatMessagesList[index],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: controller.txtSendMessage,
                  cursorColor: AppColors.mainColor,
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () {
                        EmojiPicker(
                          textEditingController: controller.txtSendMessage,
                        );
                      },
                      child: Image.asset('asset/images/emoji.png'),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.getImage();
                      },
                      child: Image.asset('asset/images/image_picker.png'),
                    ),
                    hintText: 'Enter Message',
                    hintStyle: chatFieldHintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              style: IconButton.styleFrom(
                fixedSize: const Size(50, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: AppColors.mainColor,
              ),
              alignment: Alignment.center,
              onPressed: () {
                controller.createGlobalChat(
                  CreateGlobalChatModel(
                    userId: '',
                    message: controller.txtSendMessage.text,
                    image: '',
                  ),
                );
              },
              icon: const Icon(
                Icons.send,
                size: 25,
              ),
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
