import 'package:flutter/material.dart';

import '../constrants/colors.dart';
import '../model/chat.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chat.sender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        chat.sender
            ? const SizedBox()
            : Image.asset(
                chat.avatar!,
                width: 30,
              ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24),
                  bottomRight: chat.sender
                      ? const Radius.circular(0)
                      : const Radius.circular(24),
                  topRight: const Radius.circular(24),
                  bottomLeft: chat.sender
                      ? const Radius.circular(24)
                      : const Radius.circular(0)),
              color: chat.sender ? tdBlue : tdWhite,
            ),
            child: Text(
              chat.text!,
              style: TextStyle(
                  color: chat.sender ? tdWhite : tdBlack,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        chat.sender
            ? Image.asset(
                'assets/images/avatar2.png',
                width: 30,
              )
            : const SizedBox(),
      ],
    );
  }
}
