import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primary = Color(0xff5597F5);
  static const fontFamily = "Switzer";
  static const subTitleColor = Color(0xff6F6F6F);
  static const borderColor = Color(0xff757575);
  static const bgColor = Colors.white;

  static ThemeData get light => ThemeData(
        fontFamily: fontFamily,
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.red,
        primaryColor: primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          onBackground: primary,
          primary: primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: BorderSide(
            //   color: Color(0xff9B9B9B)
            // ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: BorderSide(
            //     color: Color(0xff9B9B9B)
            // ),
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff90A1AC),
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xff090909),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: fontFamily,
            fontWeight: FontWeight.w400,
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            fixedSize: Size.fromHeight(80.h),
            disabledForegroundColor: primary.withOpacity(.5),
            textStyle: const TextStyle(
              color: primary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily,
            ),
            disabledBackgroundColor: primary.withOpacity(.05),
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(15.r)),
          ),
        ),
      );
}
