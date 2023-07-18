import 'package:dentcare/presentation/dashboard/chat/chat_main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? imageFile;

Future imageSelector(BuildContext context, String pickerType) async {
  switch (pickerType) {
    case "gallery":

      // GALLERY IMAGE PICKER
      imageFile = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);

      break;

    case "camera":

      // CAMERA CAPTURE CODE
      imageFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);

      break;
  }

  ChatMain.interface!.printdata(file: imageFile);

  // CommonInterface().printdata(file: imageFile);
  // if (imageFile != null) {
  //   messageController.text = imageFile!.name.toString();
  // } else {
  //   print("You have not taken image");
  // }
}

abstract interface class CommonInterface {
  void printdata({required XFile? file});
}
