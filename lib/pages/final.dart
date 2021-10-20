import 'package:flutter/material.dart';
import 'package:kimoa/controller/controller.dart';
import 'package:get/get.dart';
import 'package:kimoa/fonts.dart';
import 'package:kimoa/main.dart';

class Final extends StatefulWidget {
  const Final({Key? key}) : super(key: key);

  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  Controller controller = Get.put(Controller());
  double kidHeight = 0.0;

  @override
  void initState() {
    calculateKidHeight();
    super.initState();
  }

  void calculateKidHeight() {
    double myHeight = double.parse(controller.myHeight.value);
    double spouseHeight = double.parse(controller.spouseHeight.value);
    if (controller.kidSexDistinction.value == 'women') {
      kidHeight = ((myHeight + spouseHeight) / 2) - 6.5;
    } else {
      kidHeight = ((myHeight + spouseHeight) / 2) + 6.5;
    }
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
              RichText(
                  text: TextSpan(
                      children: const [
                    TextSpan(
                        text: '와',
                        style: TextStyle(
                            color: Color(0xff5A6BFF),
                            fontSize: 30,
                            fontFamily: MyFontFamily.gmarketMedium))
                  ],
                      text:
                          '${controller.myHeight.value}cm ${controller.mySexDistinction.value == 'women' ? '엄마' : '아빠'}',
                      style: const TextStyle(
                          color: Color(0xff5A6BFF),
                          fontSize: 30,
                          fontFamily: MyFontFamily.gmarketBold))),
              const SizedBox(
                height: 26,
              ),
              RichText(
                  text: TextSpan(
                      children: const [
                    TextSpan(
                        text: ' 사이에서 태어난',
                        style: TextStyle(
                            color: Color(0xff5A6BFF),
                            fontSize: 30,
                            fontFamily: MyFontFamily.gmarketMedium))
                  ],
                      text:
                          '${controller.spouseHeight.value}cm ${controller.mySexDistinction.value == 'women' ? '아빠' : '엄마'}',
                      style: const TextStyle(
                          color: Color(0xff5A6BFF),
                          fontSize: 30,
                          fontFamily: MyFontFamily.gmarketBold))),
              const SizedBox(
                height: 26,
              ),
              RichText(
                  text: TextSpan(
                      children: const [
                    TextSpan(
                        text: '의 키는 아래와 같습니다.',
                        style: TextStyle(
                            color: Color(0xff5A6BFF),
                            fontSize: 30,
                            fontFamily: MyFontFamily.gmarketMedium))
                  ],
                      text: controller.kidSexDistinction.value == "women"
                          ? '여자아이'
                          : '남자아이',
                      style: const TextStyle(
                          color: Color(0xff5A6BFF),
                          fontSize: 30,
                          fontFamily: MyFontFamily.gmarketBold))),
              const SizedBox(
                height: 110,
              ),
              Text(
                '${kidHeight}cm',
                style: const TextStyle(
                    color: Color(0xff5653FF),
                    fontSize: 130,
                    fontFamily: MyFontFamily.gmarketBold),
              ),
              const SizedBox(
                height: 154,
              ),
              GestureDetector(
                onTap: () {
                  controller.myHeight.value = '';
                  controller.spouseHeight.value = '';
                  controller.mySexDistinction.value = '';
                  controller.kidSexDistinction.value = '';
                  Get.to(const MyHomePage());
                },
                child: Container(
                  child: const Center(
                    child: Text(
                      '처음으로',
                      style: TextStyle(
                        fontFamily: MyFontFamily.gmarketMedium,
                        color: Colors.white,
                        fontSize: 25.94,
                      ),
                    ),
                  ),
                  width: 350.15,
                  height: 72.2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(3.66, 7.33),
                            blurRadius: 9.16,
                            spreadRadius: 3.66,
                            color: Colors.black.withOpacity(0.06))
                      ],
                      color: const Color(0xff5A6BFF),
                      borderRadius: BorderRadius.circular(64)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
