import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/dim.dart';
import '../../model/chat_model.dart';

class ChatMain extends StatelessWidget {
  final isLargeScreen;
  const ChatMain({
    super.key,
    required this.chatList,
    required this.isLargeScreen,
  });

  final List<ChatModel> chatList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colorWhite,
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: SizedBox(
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorBlue)),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message...',
                    ),
                  ),
                )),
                Row(
                  children: [
                    Icon(
                      Icons.attach_file,
                      color: colorBlue,
                    ),
                    width20,
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorBlue)),
                            onPressed: () {},
                            child: Icon(Icons.send))),
                    width15
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        backgroundColor: colorWhite,
        leadingWidth: 100,
        toolbarHeight: 70,
        titleSpacing: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 10,
          ),
        ),
        title: const Text(
          'Dr. Thomas',
          style: TextStyle(
            color: colorBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Icon(
            Icons.info,
            color: colorBlue,
          ),
          width15
        ],
      ),
      body: ListView(
          children: List.generate(chatList.length, (index) {
        return chatList[index].type == 0
            ? ItemOne(
                model: chatList[index],
                isLargeScreen: isLargeScreen,
              )
            : ItemTwo(
                model: chatList[index],
                isLargeScreen: isLargeScreen,
              );
      })),
    );
  }
}

class ItemOne extends StatelessWidget {
  final isLargeScreen;
  final ChatModel model;
  const ItemOne({
    super.key,
    required this.model,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          width5,
          const CircleAvatar(
            backgroundColor: colorGrey,
            child: Text(
              'OP',
              style: TextStyle(color: colorWhite),
            ),
          ),
          width20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: isLargeScreen
                    ? MediaQuery.of(context).size.width * .4
                    : MediaQuery.of(context).size.width * .7,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Lorem Ipsum has been the industrys standard dummay text ever since the 1500s,',
                    style: TextStyle(
                        color: colorBlack,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.clip),
                  ),
                ),
              ),
              height5,
              const Text(
                '8.00 PM',
                style: TextStyle(color: colorGrey, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ItemTwo extends StatelessWidget {
  final ChatModel model;
  final isLargeScreen;
  const ItemTwo({
    super.key,
    required this.model,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: isLargeScreen
                    ? MediaQuery.of(context).size.width * .4
                    : MediaQuery.of(context).size.width * .7,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Lorem Ipsum has been the industrys standard dummay text ever since the 1500s,',
                    style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.clip),
                  ),
                ),
              ),
              height5,
              const Text(
                '8.00 PM',
                style: TextStyle(color: colorGrey, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          width15,
          const CircleAvatar(
            backgroundColor: colorGrey,
            child: Text(
              'OP',
              style: TextStyle(color: colorWhite),
            ),
          ),
        ],
      ),
    );
  }
}
