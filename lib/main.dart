import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:youtube_sample_ui/screens/navigations.dart';
import 'entities.dart';

void main() {
  runApp(const ProviderScope(child: YouTube()));
}

class YouTube extends StatelessWidget {
  const YouTube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(//color: Colors.black,
        backgroundColor: Colors.black54),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        )
      ),
      home: const NavigateScreen(),
    );
  }
}






