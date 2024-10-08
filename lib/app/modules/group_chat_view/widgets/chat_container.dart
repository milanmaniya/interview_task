import 'package:flutter/material.dart';
import 'package:interview_task/app/core/values/app_color.dart';
import 'package:interview_task/app/core/values/text_style.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.userName,
    required this.time,
    required this.message,
    this.isSend = false,
  });

  final String userName;
  final String time;
  final String message;
  final bool isSend;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment:
            isSend ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userName,
                  style: textFieldTitle,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF667085),
                    fontFamily: 'Exo',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
          Container(
            width: screenWidth * 0.6,
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.chatBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isSend ? 8 : 0),
                topRight: Radius.circular(isSend ? 0 : 16),
                bottomLeft: Radius.circular(isSend ? 8 : 16),
                bottomRight: Radius.circular(isSend ? 8 : 16),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15,
                color: AppColors.eightHundredColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
