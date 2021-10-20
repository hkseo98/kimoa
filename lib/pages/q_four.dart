import 'package:flutter/material.dart';
import 'package:kimoa/controller/controller.dart';
import 'package:get/get.dart';
import 'package:kimoa/fonts.dart';
import 'package:kimoa/pages/loading.dart';

class QFour extends StatefulWidget {
  const QFour({Key? key}) : super(key: key);

  @override
  _QFourState createState() => _QFourState();
}

class _QFourState extends State<QFour> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
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
                  width: 119,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff5653FF)),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text('아이의 성별을 정해주세요.',
                style: TextStyle(
                    fontFamily: MyFontFamily.gmarketBold,
                    fontSize: 40,
                    color: Color(0xff5A6BFF),
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.kidSexDistinction.value = 'women';
                  },
                  child: Obx(() => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Center(
                          child: Text(
                            '여자',
                            style: TextStyle(
                                fontFamily: MyFontFamily.gmarketBold,
                                color: controller.kidSexDistinction.value ==
                                        'women'
                                    ? Colors.white
                                    : const Color(0xff595959),
                                fontSize: 74.69,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        width: 296,
                        height: 296,
                        decoration: BoxDecoration(
                            color: controller.kidSexDistinction.value == 'women'
                                ? const Color(0xff5A6BFF)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 6),
                                  color: Colors.black.withOpacity(0.14),
                                  blurRadius: 30,
                                  spreadRadius: 3)
                            ]),
                      )),
                ),
                const SizedBox(
                  width: 164,
                ),
                GestureDetector(
                  onTap: () {
                    controller.kidSexDistinction.value = 'men';
                  },
                  child: Obx(() => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Center(
                          child: Text(
                            '남자',
                            style: TextStyle(
                                fontFamily: MyFontFamily.gmarketBold,
                                color:
                                    controller.kidSexDistinction.value == 'men'
                                        ? Colors.white
                                        : const Color(0xff595959),
                                fontSize: 74.69,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        width: 296,
                        height: 296,
                        decoration: BoxDecoration(
                            color: controller.kidSexDistinction.value == "men"
                                ? const Color(0xff5A6BFF)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 6),
                                  color: Colors.black.withOpacity(0.14),
                                  blurRadius: 30,
                                  spreadRadius: 3)
                            ]),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 96,
            ),
            GestureDetector(
              onTap: () {
                if (controller.kidSexDistinction.value != '') {
                  print(controller.kidSexDistinction.value);
                  Get.to(const Loading());
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
                        color: controller.kidSexDistinction.value != ''
                            ? const Color(0xff5A6BFF)
                            : const Color(0xffDCDCDC),
                        borderRadius: BorderRadius.circular(64)),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
