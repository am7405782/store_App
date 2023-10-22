import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ThemeData darkTheam=ThemeData(
//     primarySwatch: Colors.blue,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: AppBarTheme(
//         titleSpacing: 20,
//         systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: HexColor('01000E'),
//             statusBarIconBrightness: Brightness.light),
//         backgroundColor: HexColor('01000E'),
//         elevation: 0,
//         titleTextStyle: const TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         )),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.blue,
//       unselectedItemColor: Colors.grey,
//       elevation: 20,
//       backgroundColor: HexColor('01000E'),
//     ),
//     textTheme: const TextTheme(
//         bodyLarge: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//         )));
ThemeData lightTheam = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.brown,
      elevation: 20,
      backgroundColor: Colors.white,
    ));
