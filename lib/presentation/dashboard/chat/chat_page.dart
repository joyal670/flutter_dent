import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/model/chat_model.dart';
import 'package:flutter/material.dart';

import 'chat_main.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  List<ChatModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    chatList.add(ChatModel(type: 1, message: "one", isSelected: true));
    chatList.add(ChatModel(type: 1, message: "two", isSelected: true));
    chatList.add(ChatModel(type: 0, message: "three", isSelected: true));
    chatList.add(ChatModel(type: 1, message: "four", isSelected: true));
    chatList.add(ChatModel(type: 0, message: "five", isSelected: true));
    chatList.add(ChatModel(type: 0, message: "six", isSelected: true));
    chatList.add(ChatModel(type: 1, message: "seven", isSelected: true));
    chatList.add(ChatModel(type: 0, message: "eight", isSelected: true));
    chatList.add(ChatModel(type: 0, message: "nine", isSelected: true));

    return ChatMain(
      chatList: chatList,
      isLargeScreen: false,
    );
  }
}
