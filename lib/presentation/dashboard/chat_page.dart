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
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));

    return ChatMain(
      chatList: chatList,
      isLargeScreen: false,
    );
  }
}
