import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goostemplate/view/pages/hero_page.dart';
import 'package:goostemplate/view/pages/home_page.dart';
import 'package:goostemplate/view/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Template codes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: HeroPage.routeName, page: () => const HeroPage()),
        GetPage(name: HomePage.routeName, page: () => const HomePage()),
        GetPage(name: StartPage.routeName, page: () => const StartPage()),
      ],
      home: const StartPage(),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/', page: () => const StartPage()),
    );
  }
}
