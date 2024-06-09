import 'package:ecommerce_with_provider/provider/data_provider.dart';
import 'package:ecommerce_with_provider/screens/mainScreen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter APP',
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        colorScheme:
            ColorScheme.fromSeed(seedColor: CupertinoColors.systemBlue),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
