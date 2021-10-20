import 'package:flutter/material.dart';
import 'package:kimoa/fonts.dart';
import 'package:get/get.dart';
import 'package:kimoa/pages/final.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    goToFinal();
    super.initState();
  }

  void goToFinal() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const Final());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '잠시만 기다려주세요',
              style: TextStyle(
                  color: Color(0xff5A6BFF),
                  fontFamily: MyFontFamily.gmarketMedium,
                  fontSize: 26),
            ),
            const SizedBox(
              height: 26,
            ),
            const Text(
              '미래 자녀의 키를 계산 중입니다',
              style: TextStyle(
                  color: Color(0xff5A6BFF),
                  fontFamily: MyFontFamily.gmarketBold,
                  fontSize: 40),
            ),
            const SizedBox(
              height: 99,
            ),
            Image.asset(
              'assets/logo.png',
              width: 198.71,
            )
          ],
        ),
      )),
    );
  }
}
