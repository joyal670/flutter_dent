// ignore_for_file: prefer_const_constructors

import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/presentation/dashboard/chat/chat_main.dart';
import 'package:dentcare/presentation/dashboard/group/group.dart';
import 'package:dentcare/presentation/dashboard/indivigual/indivigual.dart';
import 'package:flutter/material.dart';

import '../../model/chat_model.dart';
import '../widget/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeIndex = 0;
  var isLargeScreen = true;

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
          if (constraint.maxWidth < 1000) {
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
              height: 100,
              child: Container(
                decoration: const BoxDecoration(color: colorBlack),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageWidget(
                      imgUrl: "assets/images/logo_two.png",
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TitleText(
                          textStyle: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w600),
                          title: 'Team',
                        ),
                        width40,
                        TitleText(
                          textStyle: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w600),
                          title: 'Case Studies',
                        ),
                        width40,
                        TitleText(
                          textStyle: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w600),
                          title: 'Publications',
                        ),
                      ],
                    ),
                    Icon(
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageWidget(
                      imgUrl: 'assets/images/logo_two.png',
                      width: 70,
                    ),
                    Column(
                      children: [
                        TitleText(
                          textStyle: TextStyle(color: colorWhite),
                          title: 'Team',
                        ),
                        TitleText(
                            textStyle: TextStyle(color: colorWhite),
                            title: 'Case Studies'),
                        TitleText(
                          textStyle: TextStyle(color: colorWhite),
                          title: 'Publications',
                        )
                      ],
                    ),
                    Icon(
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
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: ImageWidget(
              imgUrl: "assets/images/logo.png",
              width: 130,
              height: 100,
            )),
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
                      child: TitleText(
                          textStyle: TextStyle(fontWeight: FontWeight.w600),
                          title: 'Nivin Thomas')),
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
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 80, right: 30, top: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: colorWhite,
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
                                    backgroundColor: _activeIndex == 0
                                        ? colorBlue
                                        : colorGrey,
                                    child: const Icon(
                                      Icons.person,
                                      color: colorWhite,
                                    ),
                                  ),
                                  width10,
                                  const Text(
                                    'INDIVIGUAL',
                                  )
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
                                    backgroundColor: _activeIndex == 0
                                        ? colorGrey
                                        : colorBlue,
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
                      border: Border.all(color: colorGrey.withOpacity(0.5))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ChatMain(
                      chatList: getSampleChat(),
                      isLargeScreen: isLargeScreen,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
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

List<ChatModel> getSampleChat() {
  List<ChatModel> chatList = [];
  chatList.add(ChatModel(type: 1, message: "skndf", isSelected: true));
  chatList.add(ChatModel(type: 1, message: "skndf", isSelected: false));
  chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh", isSelected: true));
  chatList.add(ChatModel(type: 1, message: "skndf", isSelected: true));
  chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh", isSelected: true));
  chatList.add(ChatModel(type: 0, message: "qufyweuqwbdh", isSelected: true));
  chatList.add(ChatModel(type: 1, message: "skndszdfasgfff", isSelected: true));
  chatList.add(
      ChatModel(type: 0, message: "qufyweuqwsfsfdfsdfbdh", isSelected: true));
  return chatList;
}
