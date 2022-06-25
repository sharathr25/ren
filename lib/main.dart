import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ren/auth/auth_service.dart';
import 'package:ren/firebase_options.dart';
import 'package:ren/routes/route_guard.dart';
import 'package:ren/routes/routes.gr.dart';

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static AppState of(BuildContext context) =>
      context.findAncestorStateOfType<AppState>()!;

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  static final authService = AuthService();
  final _appRouter = AppRouter(routeGuard: RouteGuard(authService));
  final Color primaryColor = const Color(0xff6319b8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: const Color(0xfff0e6f8),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            selectedIconTheme: IconThemeData(color: primaryColor, size: 30),
            unselectedIconTheme: IconThemeData(color: primaryColor, size: 30),
            elevation: 0,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: primaryColor, // This is a custom color variable
            textStyle: GoogleFonts.rubik(),
          )),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  minimumSize: MaterialStateProperty.all(const Size(50, 50)))),
          inputDecorationTheme: InputDecorationTheme(
              floatingLabelStyle: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: const Color(0xF1F2F6ff)),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.black),
          appBarTheme: AppBarTheme(backgroundColor: primaryColor, elevation: 0),
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
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
