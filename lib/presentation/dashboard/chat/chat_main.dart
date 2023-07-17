// ignore_for_file: prefer_const_constructors

import 'package:dentcare/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:modals/modals.dart';

import '../../../core/colors.dart';
import '../../../core/dim.dart';
import '../../../model/chat_model.dart';
import 'package:image_picker/image_picker.dart';

class ChatMain extends StatelessWidget {
  final isLargeScreen;
  final List<ChatModel> chatList;

  ChatMain({
    super.key,
    required this.chatList,
    required this.isLargeScreen,
  });

  XFile? imageFile = null;
  final messageController = TextEditingController();

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
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: messageController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message...',
                    ),
                  ),
                )),
                Row(
                  children: [
                    // InkWell(
                    //   onTap: () => {
                    //     imageSelector(context, "gallery"),
                    //   },
                    //   child: const Icon(
                    //     Icons.attach_file,
                    //     color: colorBlue,
                    //   ),
                    // ),
                    AttachmentAnchorPage(),
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
                                    const MaterialStatePropertyAll(colorBlue)),
                            onPressed: () {},
                            child: const Icon(Icons.send))),
                    width15
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
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
        actions: [AnchorPage()],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/inner_background.png'),
                fit: BoxFit.cover)),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return chatList[index].type == 0
                  ? ItemOne(
                      model: chatList[index], isLargeScreen: isLargeScreen)
                  : ItemTwo(
                      model: chatList[index], isLargeScreen: isLargeScreen);
            },
            separatorBuilder: (context, index) => height0,
            itemCount: chatList.length),
      ),
    );
  }

  Future imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case "gallery":

        /// GALLERY IMAGE PICKER
        imageFile = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 100);

        break;
    }

    if (imageFile != null) {
      messageController.text = imageFile!.name.toString();
    } else {
      print("You have not taken image");
    }
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
              child: TitleText(
                  textStyle: TextStyle(color: colorWhite), title: "OP")),
          width20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colorGrey.withOpacity(0.2))),
                  child: TitleText(
                      textStyle: TextStyle(
                          color: colorBlack,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip),
                      title: model.message)),
              height5,
              const TitleText(
                  textStyle:
                      TextStyle(color: colorBlack, fontWeight: FontWeight.w500),
                  title: "8.00 PM"),
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
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TitleText(
                    textStyle: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.clip),
                    title: model.message),
              ),
              height5,
              const TitleText(
                  textStyle:
                      TextStyle(color: colorBlack, fontWeight: FontWeight.w500),
                  title: "8.00 PM"),
            ],
          ),
          width15,
          const CircleAvatar(
              backgroundColor: colorGrey,
              child: TitleText(
                  textStyle: TextStyle(color: colorWhite), title: "OP")),
        ],
      ),
    );
  }
}

class AnchorPage extends StatelessWidget {
  const AnchorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ModalAnchor(
            tag: 'anchorTag',
            child: Icon(
              Icons.info,
              color: colorBlue,
            ),
          ),
          InkWell(
            onTap: () {
              showModal(ModalEntry.anchored(context,
                  tag: 'anchoredModalTag',
                  anchorTag: 'anchorTag',
                  modalAlignment: Alignment.topRight,
                  anchorAlignment: Alignment.centerRight,
                  barrierDismissible: true,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: InfoWidget())));
            },
            child: Row(
              children: const [
                Icon(
                  Icons.info,
                  color: colorBlue,
                ),
                width15
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: colorPeach,
                radius: 30,
                child: Text(
                  'A',
                  style:
                      TextStyle(color: colorBlack, fontWeight: FontWeight.bold),
                ),
              ),
              width20,
              Text(
                'Dr.Thomas',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: colorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )
            ],
          ),
          height10,
          Divider(
            thickness: 1,
            color: colorGrey.withOpacity(0.3),
          ),
          height25,
          Text(
            'PERSONAL DETAILS',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: colorBlack,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          height10,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: colorWildSand2,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'First Name',
                        style: TextStyle(
                            color: colorGrey,
                            decoration: TextDecoration.none,
                            fontSize: 10),
                      ),
                      height5,
                      Text(
                        "Dr",
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              width20,
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: colorWildSand2,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Last Name',
                        style: TextStyle(
                            color: colorGrey,
                            decoration: TextDecoration.none,
                            fontSize: 10),
                      ),
                      height5,
                      Text(
                        "Thomas",
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          height15,
          Container(
            width: 500,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: colorWildSand2, borderRadius: BorderRadius.circular(7)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Email Address',
                  style: TextStyle(
                      color: colorGrey,
                      decoration: TextDecoration.none,
                      fontSize: 10),
                ),
                height5,
                Text(
                  "info@gmail.com",
                  style: TextStyle(
                      color: colorMineShaft,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontSize: 12),
                )
              ],
            ),
          ),
          height30,
          Divider(
            thickness: 1,
            color: colorGrey.withOpacity(0.3),
          ),
          height25,
          Text(
            "You've Signed In",
            style: TextStyle(
              color: colorCodGrey,
              fontSize: 33,
              fontWeight: FontWeight.w200,
              decoration: TextDecoration.none,
            ),
          ),
          Row(
            children: const [
              Text(
                "With",
                style: TextStyle(
                  color: colorCodGrey,
                  fontSize: 33,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                ),
              ),
              width5,
              ImageWidget(
                imgUrl: 'assets/images/logo_2.png',
                width: 100,
              ),
              width5,
              Text(
                "Chat",
                style: TextStyle(
                  color: colorCodGrey,
                  fontSize: 33,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AttachmentAnchorPage extends StatelessWidget {
  const AttachmentAnchorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ModalAnchor(
            tag: 'AttachmentAnchorPage',
            child: Icon(
              Icons.attach_file,
              color: colorBlue,
            ),
          ),
          InkWell(
            onTap: () {
              showModal(ModalEntry.anchored(context,
                  tag: 'anchoredModalTag',
                  anchorTag: 'AttachmentAnchorPage',
                  modalAlignment: Alignment.bottomCenter,
                  anchorAlignment: Alignment.topCenter,
                  barrierDismissible: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: AddAttachmentWidget(),
                  )));
            },
            child: Row(
              children: const [
                Icon(
                  Icons.attach_file,
                  color: colorBlue,
                ),
                width15
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddAttachmentWidget extends StatelessWidget {
  const AddAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: colorBlue,
          onPressed: () {},
          child: Icon(
            Icons.camera,
            color: colorWhite,
          ),
        ),
        height15,
        FloatingActionButton(
          backgroundColor: colorBlue,
          onPressed: () {},
          child: Icon(
            Icons.photo,
            color: colorWhite,
          ),
        ),
        height15,
        FloatingActionButton(
          backgroundColor: colorBlue,
          onPressed: () {},
          child: Icon(
            Icons.edit_document,
            color: colorWhite,
          ),
        ),
      ],
    );
  }
}
