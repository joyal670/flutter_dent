// ignore_for_file: prefer_const_constructors

import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/model/person_model.dart';
import 'package:dentcare/presentation/dashboard/chat/chat_page.dart';
import 'package:dentcare/presentation/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/debouncer.dart';

class IndivigualChatScreen extends StatefulWidget {
  final bool isLargeScreen;
  IndivigualChatScreen({super.key, required this.isLargeScreen});

  @override
  State<IndivigualChatScreen> createState() => _IndivigualChatScreenState();
}

class _IndivigualChatScreenState extends State<IndivigualChatScreen> {
  // to make a delay while typing
  final _debouncer = Debouncer(milliseconds: 500);

  int selectedIndex = 0;

  List<PersonModel> personModel = [];

  @override
  Widget build(BuildContext context) {
    personModel.addAll(getSamplePerson());

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          widget.isLargeScreen ? height20 : height0,
          SizedBox(
            height: 50,
            child: SearchBox(
              debouncer: _debouncer,
              isLargeScreen: widget.isLargeScreen,
            ),
          ),
          widget.isLargeScreen ? height20 : height10,
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      for (var i = 0; i < personModel.length; i++) {
                        personModel[i].isSelected = false;
                      }
                      setState(() {
                        personModel[index].isSelected = true;
                      });

                      if (widget.isLargeScreen) {
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(),
                            ));
                      }
                    },
                    child: ChatListItem(
                      personModel: personModel[index],
                      isLargeScreen: widget.isLargeScreen,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return height10;
                },
                itemCount: personModel.length),
          ),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  PersonModel personModel;
  final isLargeScreen;

  ChatListItem({
    super.key,
    required this.personModel,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: colorBlue,
      elevation: isLargeScreen
          ? personModel.isSelected
              ? 10
              : 1
          : 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
            ),
            width15,
            TitleText(
              textStyle: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              title: 'DR. Thomas',
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: colorBlue),
              child: const Text('0'),
            )
          ],
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

List<PersonModel> getSamplePerson() {
  List<PersonModel> chatList = [];
  chatList.add(PersonModel(messageCount: 1, name: "skndf", isSelected: true));
  chatList.add(PersonModel(messageCount: 1, name: "skndf", isSelected: false));
  chatList.add(
      PersonModel(messageCount: 0, name: "qufyweuqwbdh", isSelected: false));
  chatList.add(PersonModel(messageCount: 1, name: "skndf", isSelected: false));
  return chatList;
}
