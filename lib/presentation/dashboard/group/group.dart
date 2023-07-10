import 'package:dentcare/core/colors.dart';
import 'package:flutter/material.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          color: colorAmber, borderRadius: BorderRadius.circular(10)),
    ));
  }
}
