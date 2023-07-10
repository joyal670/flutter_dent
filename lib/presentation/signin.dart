import 'package:dentcare/core/colors.dart';
import 'package:dentcare/core/dim.dart';
import 'package:dentcare/presentation/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../core/colors.dart';

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
            return SignUpSmall();
          } else {
            return SignUpLarge();
          }
        },
      ),
    );
  }

  Widget SignUpSmall() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20,
              ImageWidget(imgUrl: "assets/images/logo.png"),
              height10,
              const Text(
                'Connecting smile \ncreators across \nthe Globe.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorBlack,
                  fontSize: 30,
                ),
              ),
              height40,
              ImageWidget(imgUrl: 'assets/images/users.png'),
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
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      height10,
                      const Text(
                        'Lorem Ipsum has been the industrys standard dummy text ever since.',
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      height30,
                      const Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          width10,
                          Text(
                            'User Name',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      height10,
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            fillColor: colorWhite,
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          style: const TextStyle(color: colorBlack),
                        ),
                      ),
                      height20,
                      const Row(
                        children: [
                          Icon(Icons.lock_outline),
                          width10,
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      height5,
                      SizedBox(
                        height: 45,
                        child: TextFormField(
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
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            filled: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          style: const TextStyle(color: colorBlack),
                        ),
                      ),
                      height25,
                      SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7))),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorBlue)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardScreen()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
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

  Widget SignUpLarge() {
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
              Text(
                'Connecting smile \ncreators across \nthe Globe.',
                style: TextStyle(
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
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      height10,
                      const Text(
                        'Lorem Ipsum has been the industrys\nstandard dummy text ever since.',
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                      height30,
                      const Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          width10,
                          Text(
                            'User Name',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      height10,
                      SizedBox(
                        height: 45,
                        width: 400,
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            fillColor: colorWhite,
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          style: const TextStyle(color: colorBlack),
                        ),
                      ),
                      height20,
                      const Row(
                        children: [
                          Icon(Icons.lock_outline),
                          width10,
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      height5,
                      SizedBox(
                        height: 45,
                        width: 400,
                        child: TextFormField(
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
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            filled: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          style: const TextStyle(color: colorBlack),
                        ),
                      ),
                      height25,
                      SizedBox(
                          width: 400,
                          height: 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7))),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorBlue)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardScreen()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
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
