import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';

class RecieveChat extends StatelessWidget {
  const RecieveChat({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ChatBubble(
        clipper: ChatBubbleClipper6(type: BubbleType.receiverBubble),
        backGroundColor: AppColors.chatBackgrund,
        child: Text(
          message,
          style: chatFieldHintText,
        ),
      ),
    );
  }
}
