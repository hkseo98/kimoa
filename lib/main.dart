import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimoa/fonts.dart';
import 'package:kimoa/pages/q_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation =
      ColorTween(begin: const Color(0xff5A5A5A), end: Colors.white)
          .animate(aniController)
        ..addListener(() {
          setState(() {});
        });
  late AnimationController aniController = AnimationController(
      reverseDuration: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 1000),
      vsync: this);

  @override
  void initState() {
    aniController.repeat(reverse: true);
    super.initState();
  }

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
        child: GestureDetector(
          onTap: () {
            Get.to(const QOne());
          },
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '키모아가 미래 자녀의 키를',
                    style: TextStyle(
                        color: Color(0xff5A6BFF),
                        fontSize: 60,
                        fontFamily: MyFontFamily.gmarketBold),
                  ),
                  const Text(
                    '예상해드립니다',
                    style: TextStyle(
                        color: Color(0xff5A6BFF),
                        fontSize: 60,
                        fontFamily: MyFontFamily.gmarketBold),
                  ),
                  const SizedBox(
                    height: 88,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  Text(
                    '화면을 터치해주세요',
                    style: TextStyle(color: animation.value, fontSize: 22),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
