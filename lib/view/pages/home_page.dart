import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/setting_menu_item.dart';
import 'hero_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Home",
          showBackButton: false,
          showCloseButton: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              SettingMenuItem(
                menu: "Hero",
                onPressed: () {
                  Get.toNamed(HeroPage.routeName);
                },
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
