import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesata_mobile/pages/home_page.dart';
import 'package:wesata_mobile/pages/list_page.dart';
import 'package:wesata_mobile/pages/splash_page.dart';
import 'package:wesata_mobile/providers/shop_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/list': (context) => const ListPage(),
        },
      ),
    );
  }
}
