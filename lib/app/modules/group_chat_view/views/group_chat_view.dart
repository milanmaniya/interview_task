import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:interview_task/app/core/model/create_global_chat_model.dart';
import 'package:interview_task/app/core/utils/shared_preference.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';
import 'package:interview_task/app/modules/group_chat_view/controller/group_chat_controller.dart';

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
            fontFamily: 'Cherry Swash',
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
                'asset/images/fluent-emoji-flat_magic-wand.svg'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, screenHeight * 0.01),
          child: Obx(
            () => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Text(
                    'Hi, ${controller.userName.value}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Exo',
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: 80,
                ),
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     SizedBox(
                  //       width: screenWidth * 0.6,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             userNmae,
                  //             style: textFieldTitle,
                  //           ),
                  //           Text(
                  //             time,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.w400,
                  //               color: Color(0XFF667085),
                  //               fontFamily: 'Exo',
                  //               fontSize: 15,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: screenHeight * 0.005,
                  //     ),
                  //     ClipRRect(
                  //       borderRadius: const BorderRadius.only(
                  //         bottomLeft: Radius.circular(16),
                  //         bottomRight: Radius.circular(16),
                  //         topLeft: Radius.circular(16),
                  //       ),
                  //       child: Image.asset(
                  //         'asset/images/splash_screen_bg.png',
                  //         height: 180,
                  //         width: 180,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ...List.generate(
                    controller.messageList.length,
                    (index) => controller.messageList[index],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: const BoxDecoration(color: Colors.white),
            child: Obx(
              () => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            style: textFieldStyle,
                            controller: controller.txtSendMessage,
                            cursorColor: AppColors.mainColor,
                            decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  controller.showEmoji.value =
                                      !controller.showEmoji.value;
                                },
                                // child: SvgPicture.asset(
                                //   'asset/images/emoji.svg',
                                //   height: 20,
                                //   width: 20,
                                //   fit: BoxFit.cover,
                                // ),
                                child: Image.asset('asset/images/emoji.png'),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.getImage();
                                },
                                // child: SvgPicture.asset(
                                //     'asset/images/image_picker.svg'),
                                child: Image.asset(
                                    'asset/images/image_picker.png'),
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
                                borderSide: BorderSide(
                                    color: AppColors.mainColor, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                    color: AppColors.mainColor, width: 1.0),
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.mainColor,
                        ),
                        alignment: Alignment.center,
                        onPressed: () async {
                          final userId =
                              await SharedPreferenceService().getId();

                          controller.createGlobalChat(
                            CreateGlobalChatModel(
                              userId: userId.toString(),
                              message: controller.txtSendMessage.text,
                              image: '',
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                            'asset/images/send_message_icon.svg'),
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                  controller.showEmoji.value
                      ? EmojiPicker(
                          textEditingController: controller.txtSendMessage,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
