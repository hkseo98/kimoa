import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimoa/controller/controller.dart';
import 'package:kimoa/fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kimoa/pages/q_three.dart';

class QTwo extends StatefulWidget {
  const QTwo({Key? key}) : super(key: key);

  @override
  _QTwoState createState() => _QTwoState();
}

class _QTwoState extends State<QTwo> with SingleTickerProviderStateMixin {
  Controller controller = Get.put(Controller());
  late Animation<Color?> animation =
      ColorTween(begin: const Color(0xff595959), end: Colors.white)
          .animate(aniController)
        ..addListener(() {
          setState(() {});
        });
  late AnimationController aniController = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this);

  @override
  void dispose() {
    aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 136,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffD2D9DA)),
                      ),
                      Container(
                        width: 60,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff5653FF)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    '본인의 키를 입력해주세요.',
                    style: TextStyle(
                        fontFamily: MyFontFamily.gmarketBold,
                        fontSize: 40,
                        color: Color(0xff5A6BFF)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                        intensity: 1,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(23)),
                        border: const NeumorphicBorder(
                            width: 2, color: Color(0xff5A6BFF)),
                        depth: -4,
                        color: const Color(0xffFAFAFA)),
                    child: SizedBox(
                      width: 359,
                      height: 116,
                      child: Obx(() => Padding(
                          padding: const EdgeInsets.only(right: 95),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                controller.myHeight.value,
                                style: const TextStyle(
                                    color: Color(0xff595959),
                                    fontFamily: MyFontFamily.gmarketMedium,
                                    fontSize: 50),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'cm',
                                  style: TextStyle(
                                      color: Color(0xff595959),
                                      fontFamily: MyFontFamily.gmarketMedium,
                                      fontSize: 40),
                                ),
                              )
                            ],
                          ))),
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.myHeight.value != '') {
                        if (controller.myHeight
                                .value[controller.myHeight.value.length - 1] ==
                            '.') {
                          controller.myHeight.value =
                              controller.myHeight.value + '0';
                        }
                        print(controller.myHeight.value);

                        Get.to(const QThree());
                      }
                    },
                    child: Obx(() => AnimatedContainer(
                          child: const Center(
                            child: Text(
                              '다음으로',
                              style: TextStyle(
                                fontFamily: MyFontFamily.gmarketMedium,
                                color: Colors.white,
                                fontSize: 25.94,
                              ),
                            ),
                          ),
                          duration: const Duration(milliseconds: 200),
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
                              color: controller.myHeight.value != ''
                                  ? const Color(0xff5A6BFF)
                                  : const Color(0xffDCDCDC),
                              borderRadius: BorderRadius.circular(64)),
                        )),
                  )
                ],
              ),
              const SizedBox(
                width: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button7IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '7';
                            }
                          },
                          onTapUp: (val) {
                            controller.button7IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '7',
                                    style: TextStyle(
                                        color:
                                            controller.button7IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button7IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button8IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '8';
                            }
                          },
                          onTapUp: (val) {
                            controller.button8IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '8',
                                    style: TextStyle(
                                        color:
                                            controller.button8IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button8IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button9IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '9';
                            }
                          },
                          onTapUp: (val) {
                            controller.button9IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '9',
                                    style: TextStyle(
                                        color:
                                            controller.button9IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button9IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button4IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '4';
                            }
                          },
                          onTapUp: (val) {
                            controller.button4IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        color:
                                            controller.button4IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button4IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button5IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '5';
                            }
                          },
                          onTapUp: (val) {
                            controller.button5IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        color:
                                            controller.button5IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button5IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button6IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '6';
                            }
                          },
                          onTapUp: (val) {
                            controller.button6IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color:
                                            controller.button6IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button6IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button1IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '1';
                            }
                          },
                          onTapUp: (val) {
                            controller.button1IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color:
                                            controller.button1IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button1IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button2IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '2';
                            }
                          },
                          onTapUp: (val) {
                            controller.button2IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color:
                                            controller.button2IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button2IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button3IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '3';
                            }
                          },
                          onTapUp: (val) {
                            controller.button3IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color:
                                            controller.button3IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button3IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.button0IsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value == '') {
                              return;
                            }
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '0';
                            }
                          },
                          onTapUp: (val) {
                            controller.button0IsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                        color:
                                            controller.button0IsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.button0IsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.buttonDotIsSelected.value = true;
                            aniController.forward();
                            if (controller.myHeight.value == '') {
                              return;
                            }
                            if (controller.myHeight.value.contains('.')) {
                              return;
                            }
                            if (controller.myHeight.value.length < 5) {
                              controller.myHeight.value =
                                  controller.myHeight.value + '.';
                            }
                          },
                          onTapUp: (val) {
                            controller.buttonDotIsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                  child: Text(
                                    '.',
                                    style: TextStyle(
                                        color:
                                            controller.buttonDotIsSelected.value
                                                ? animation.value
                                                : const Color(0xff595959),
                                        fontFamily: MyFontFamily.gmarketBold,
                                        fontSize: 50),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.buttonDotIsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: GestureDetector(
                          onTapDown: (val) {
                            controller.buttonBackIsSelected.value = true;
                            aniController.forward();
                            int a = controller.myHeight.value.length;
                            controller.myHeight.value =
                                controller.myHeight.value.substring(0, a - 1);
                          },
                          onTapUp: (val) {
                            controller.buttonBackIsSelected.value = false;
                            aniController.reverse();
                          },
                          child: Obx(() => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 141,
                                height: 141,
                                child: Center(
                                    child: Image.asset(
                                  'assets/arrow_back.png',
                                  width: 46.95,
                                  height: 38.7,
                                )),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 7.09),
                                          blurRadius: 17.71,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    borderRadius: BorderRadius.circular(80),
                                    color: controller.buttonBackIsSelected.value
                                        ? const Color(0xff5A6BFF)
                                        : const Color(0xffF5F5F5)),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
