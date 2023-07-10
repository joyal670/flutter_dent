import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../dashboard/dashboard.dart';

class TitleText extends StatelessWidget {
  final title;
  final textStyle;

  const TitleText({
    super.key,
    required this.textStyle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final imgUrl;
  const ImageWidget({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgUrl,
    );
  }
}

class TextFormUserNameWidget extends StatelessWidget {
  final hintTitle;

  const TextFormUserNameWidget({
    super.key,
    required this.hintTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
        fillColor: colorWhite,
        filled: true,
        hintText: hintTitle,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(7)),
      ),
      style: const TextStyle(color: colorBlack),
    );
  }
}

class TextFormPasswordWidget extends StatefulWidget {
  const TextFormPasswordWidget({super.key});

  @override
  State<TextFormPasswordWidget> createState() => _TextFormPasswordWidgetState();
}

class _TextFormPasswordWidgetState extends State<TextFormPasswordWidget> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        fillColor: colorWhite,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off)),
        filled: true,
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(7)),
      ),
      style: const TextStyle(color: colorBlack),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
            backgroundColor: const MaterialStatePropertyAll(colorBlue)),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()));
        },
        child: const TitleText(
            textStyle: TextStyle(fontWeight: FontWeight.bold), title: 'Login'));
  }
}
