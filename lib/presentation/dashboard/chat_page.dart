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
    chatList.add(ChatModel(type: 1, message: "one"));
    chatList.add(ChatModel(type: 1, message: "two"));
    chatList.add(ChatModel(type: 0, message: "three"));
    chatList.add(ChatModel(type: 1, message: "four"));
    chatList.add(ChatModel(type: 0, message: "five"));
    chatList.add(ChatModel(type: 0, message: "six"));
    chatList.add(ChatModel(type: 1, message: "seven"));
    chatList.add(ChatModel(type: 0, message: "eight"));
    chatList.add(ChatModel(type: 0, message: "nine"));

    return ChatMain(
      chatList: chatList,
      isLargeScreen: false,
    );
  }
}
