import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  static const routeName = '/start';

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.toNamed(HomePage.routeName);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
            // alignment: Alignment.center,
            // child: const Text(
            //   "Start Page",
            //   style: TextStyle(
            //     fontSize: 48,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            ),
      ),
    );
  }
}
