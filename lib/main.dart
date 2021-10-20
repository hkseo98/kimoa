import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 250,
            ),
            const SizedBox(
              height: 30.33,
            ),
            Image.asset(
              'assets/title.png',
              width: 128.78,
            ),
            const SizedBox(
              height: 120.04,
            ),
            SizedBox(
              width: 350,
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Get.to(const QOne());
                  },
                  child: Image.asset(
                    'assets/start_button.png',
                    width: 350.15,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
