import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ren/screens/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0xff6319b8),
          scaffoldBackgroundColor: const Color(0xfff0e6f8),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            selectedIconTheme:
                IconThemeData(color: Color(0xff6319b8), size: 30),
            unselectedIconTheme:
                IconThemeData(color: Color(0xff6319b8), size: 30),
            elevation: 0,
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff6319b8), elevation: 0),
          textTheme: TextTheme(
            headline1: GoogleFonts.rubik(
                fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            headline2: GoogleFonts.rubik(
                fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3:
                GoogleFonts.rubik(fontSize: 49, fontWeight: FontWeight.w400),
            headline4: GoogleFonts.rubik(
                fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headline5:
                GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w400),
            headline6: GoogleFonts.rubik(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle1: GoogleFonts.rubik(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            subtitle2: GoogleFonts.rubik(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyText1: GoogleFonts.rubik(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyText2: GoogleFonts.rubik(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.rubik(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.rubik(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            overline: GoogleFonts.rubik(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          )),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}
