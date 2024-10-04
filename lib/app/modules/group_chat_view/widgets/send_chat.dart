import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';

class SendChat extends StatelessWidget {
  const SendChat({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChatBubble(
          clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
          backGroundColor: AppColors.chatBackgrund,
          child: Text(
            message,
            style: chatFieldHintText,
          ),
        ),
      ],
    );
  }
}
