import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/presentation/dashboard/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'debouncer.dart';

class IndivigualChatScreen extends StatelessWidget {
  final bool isLargeScreen;
  IndivigualChatScreen({super.key, required this.isLargeScreen});

  // to make a delay while typing
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          isLargeScreen ? height20 : height0,
          SizedBox(
            height: 50,
            child: SearchBox(
              debouncer: _debouncer,
              isLargeScreen: isLargeScreen,
            ),
          ),
          isLargeScreen ? height20 : height10,
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ChatListItem(
                    isLargeScreen: isLargeScreen,
                  );
                },
                separatorBuilder: (context, index) {
                  return height10;
                },
                itemCount: 20),
          ),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final bool isLargeScreen;
  const ChatListItem({
    super.key,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: colorBlue,
      elevation: 1,
      child: InkWell(
        onTap: () {
          if (isLargeScreen) {
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
              ),
              width15,
              const Text(
                'DR. Thomas',
                style: TextStyle(
                  color: colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: colorBlue),
                child: const Text('0'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final isLargeScreen;
  const SearchBox({
    super.key,
    required Debouncer debouncer,
    this.isLargeScreen,
  }) : _debouncer = debouncer;

  final Debouncer _debouncer;

  @override
  Widget build(BuildContext context) {
    print(isLargeScreen);
    return CupertinoSearchTextField(
      placeholder: "Search chat",
      decoration: BoxDecoration(
          border: isLargeScreen
              ? Border.all(color: colorGrey.withOpacity(0.2))
              : Border.all(color: colorGrey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(5)),
      onChanged: (value) {
        if (value.isEmpty) {
          return;
        }
        _debouncer.run(() {});
      },
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.grey,
      ),
      prefixInsets: const EdgeInsets.only(left: 10, right: 10),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: Colors.grey,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
