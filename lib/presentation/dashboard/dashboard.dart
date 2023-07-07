import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/presentation/dashboard/chat_main.dart';
import 'package:dentcare/presentation/dashboard/group.dart';
import 'package:dentcare/presentation/dashboard/indivigual.dart';
import 'package:flutter/material.dart';

import '../../model/chat_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeIndex = 0;
  var isLargeScreen = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(
      () {
        setState(() {
          _activeIndex = _tabController.index;
        });
      },
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 600) {
            isLargeScreen = false;
            return smallScreen();
          } else {
            isLargeScreen = true;
            return largeScreen();
          }
        },
      ),
      backgroundColor: colorBackground,
      bottomNavigationBar: isLargeScreen
          ? SizedBox(
              width: double.infinity,
              height: 120,
              child: Container(
                decoration: const BoxDecoration(color: colorBlack),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo_two.png",
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Team',
                          style: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w600),
                        ),
                        width40,
                        Text(
                          'Case Studies',
                          style: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w600),
                        ),
                        width40,
                        Text(
                          'Publications',
                          style: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.language,
                      color: colorGrey,
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(
              width: double.infinity,
              height: 70,
              child: Container(
                decoration: const BoxDecoration(color: colorBlack),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo_two.png",
                      width: 70,
                    ),
                    const Column(
                      children: [
                        Text(
                          'Team',
                          style: TextStyle(color: colorWhite),
                        ),
                        Text(
                          'Case Studies',
                          style: TextStyle(color: colorWhite),
                        ),
                        Text(
                          'Publications',
                          style: TextStyle(color: colorWhite),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.language,
                      color: colorGrey,
                    ),
                  ],
                ),
              ),
            ),
      appBar: AppBar(
        backgroundColor: colorWhite,
        automaticallyImplyLeading: false,
        elevation: 1.5,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset(
            "assets/images/logo.png",
            width: 130,
            height: 100,
          ),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 40,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: colorBlack,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      'Nivin Thomas',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              width50,
            ],
          )
        ],
      ),
    );
  }

  Widget largeScreen() {
    List<ChatModel> chatList = [];
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    chatList.add(ChatModel(type: 1, message: "skndf"));
    chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh"));
    return SafeArea(
        child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 80, right: 30, top: 30),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colorBlue.withOpacity(0.5))),
              child: Column(
                children: [
                  height20,
                  TabBar(
                      controller: _tabController,
                      labelColor: Colors.blue,
                      indicatorWeight: 2,
                      indicatorColor: colorBlue,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      _activeIndex == 0 ? colorBlue : colorGrey,
                                  child: const Icon(
                                    Icons.person,
                                    color: colorWhite,
                                  ),
                                ),
                                width10,
                                const Text('INDIVIGUAL')
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      _activeIndex == 0 ? colorGrey : colorBlue,
                                  child: const Icon(
                                    Icons.group,
                                    color: colorWhite,
                                  ),
                                ),
                                width10,
                                const Text('GROUP')
                              ],
                            ),
                          ),
                        )
                      ]),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        IndivigualChatScreen(
                          isLargeScreen: isLargeScreen,
                        ),
                        const GroupChatScreen()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 30, top: 30),
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: colorBlue.withOpacity(0.5))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ChatMain(
                    chatList: chatList,
                    isLargeScreen: isLargeScreen,
                  ),
                )),
          ),
        )
      ],
    ));
  }

  Widget smallScreen() {
    return SafeArea(
      child: Column(
        children: [
          height20,
          TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              indicatorWeight: 2,
              indicatorColor: colorBlue,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            _activeIndex == 0 ? colorBlue : colorGrey,
                        child: const Icon(
                          Icons.person,
                          color: colorWhite,
                        ),
                      ),
                      width10,
                      const Text('INDIVIGUAL')
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            _activeIndex == 0 ? colorGrey : colorBlue,
                        child: const Icon(
                          Icons.group,
                          color: colorWhite,
                        ),
                      ),
                      width10,
                      const Text('GROUP')
                    ],
                  ),
                )
              ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                IndivigualChatScreen(
                  isLargeScreen: isLargeScreen,
                ),
                const GroupChatScreen()
              ],
            ),
          )
        ],
      ),
    );
  }
}
