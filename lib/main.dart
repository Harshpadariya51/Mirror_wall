import 'package:flutter/material.dart';
import 'package:mirror_wall_app/modules/provider/mirror_wall_provider.dart';
import 'package:mirror_wall_app/modules/view/bookmark.dart';
import 'package:mirror_wall_app/modules/view/education_page.dart';
import 'package:mirror_wall_app/modules/view/google_page.dart';
import 'package:mirror_wall_app/modules/view/ott_detail_page.dart';
import 'package:mirror_wall_app/modules/view/ott_page.dart';
import 'package:mirror_wall_app/modules/view/searchs_detail_page.dart';
import 'package:mirror_wall_app/screen/home_page.dart';
import 'package:mirror_wall_app/screen/splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => mirrorwallprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => mirrorprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => mirrorbrowsers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => const Home_page(),
          'Education_page': (context) => const Education_page(),
          // 'education_detail_page': (context) => const education_detail_page(),
          'ott_page': (context) => const ott_page(),
          'ott_detail_page': (context) => const ott_detail_page(),
          'google_page': (context) => const google_page(),
          'splash_screen': (context) => const splash_screen(),
          'bookmark': (context) => const bookmark(),
          'search_detail_page': (context) => const search_detail_page()
        },
      ),
    );
  }
}
