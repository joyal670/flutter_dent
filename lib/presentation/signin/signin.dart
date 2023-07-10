import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/presentation/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../widget/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 1000) {
            return signUpSmall();
          } else {
            return signUpLarge();
          }
        },
      ),
    );
  }

  Widget signUpSmall() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20,
              const ImageWidget(imgUrl: "assets/images/logo.png"),
              height10,
              const TitleText(
                  title: 'Connecting smile\ncreators across\nthe Globe',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorBlack,
                    fontSize: 30,
                  )),
              height40,
              const ImageWidget(imgUrl: 'assets/images/users.png'),
              height40,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colorMobyDick,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height20,
                      const TitleText(
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          title: 'Sign In'),
                      height10,
                      const TitleText(
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                          title:
                              'Lorem Ipsum has been the industrys standard dummy text ever since.'),
                      height30,
                      const Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          width10,
                          TitleText(
                              textStyle: TextStyle(fontWeight: FontWeight.w600),
                              title: 'User Name')
                        ],
                      ),
                      height10,
                      const SizedBox(
                        height: 45,
                        child: TextFormUserNameWidget(
                          hintTitle: '',
                        ),
                      ),
                      height20,
                      const Row(
                        children: [
                          Icon(Icons.lock_outline),
                          width10,
                          TitleText(
                              textStyle: TextStyle(fontWeight: FontWeight.w600),
                              title: 'Password')
                        ],
                      ),
                      height5,
                      const SizedBox(
                          height: 45, child: TextFormPasswordWidget()),
                      height25,
                      SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: SignUpButton(context: context)),
                      height40
                    ],
                  ),
                ),
              ),
              height30
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpLarge() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20,
              ImageWidget(
                imgUrl: "assets/images/logo.png",
              ),
              height10,
              TitleText(
                title: 'Connecting smile\ncreators across\nthe Globe',
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorBlack,
                  fontSize: 50,
                  letterSpacing: 0,
                  wordSpacing: 0,
                ),
              ),
              height40,
              ImageWidget(imgUrl: 'assets/images/users.png'),
              height40,
            ],
          ),
          width50,
          Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: colorMobyDick,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height20,
                      const TitleText(
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                          title: 'Sign In'),
                      height10,
                      const TitleText(
                        textStyle: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                        title:
                            'Lorem Ipsum has been the industrys\nstandard dummy text ever since.',
                      ),
                      height30,
                      const Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          width10,
                          TitleText(
                            textStyle: TextStyle(fontWeight: FontWeight.w600),
                            title: 'User Name',
                          )
                        ],
                      ),
                      height10,
                      const SizedBox(
                          height: 45,
                          width: 400,
                          child: TextFormUserNameWidget(
                            hintTitle: '',
                          )),
                      height20,
                      const Row(
                        children: [
                          Icon(Icons.lock_outline),
                          width10,
                          TitleText(
                            textStyle: TextStyle(fontWeight: FontWeight.w600),
                            title: 'Password',
                          )
                        ],
                      ),
                      height5,
                      const SizedBox(
                          height: 45,
                          width: 400,
                          child: TextFormPasswordWidget()),
                      height25,
                      SizedBox(
                          width: 400,
                          height: 45,
                          child: SignUpButton(context: context)),
                      height40
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
