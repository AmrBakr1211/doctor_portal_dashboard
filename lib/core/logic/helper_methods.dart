import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/locale_keys.g.dart';
import '../design/app_image.dart';
import '../design/app_loading.dart';

Future openUrl(url) async {
  try {
    if (!await launchUrl(Uri.parse(url),
        mode: Platform.isAndroid ? LaunchMode.externalNonBrowserApplication : LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(enableJavaScript: true, enableDomStorage: true))) {
      showMessage(LocaleKeys.someThingWrongWithUrl.tr());
    }
  } catch (ex) {
    showMessage(LocaleKeys.someThingWrongWithUrl.tr());
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo(String route, {bool keepHistory = true,arguments}) async {
  return await Navigator.pushNamedAndRemoveUntil(
    navigatorKey.currentContext!,
    arguments: arguments,
    route,
    (route) => keepHistory,
  );
}

enum MessageType { success, fail, warning }

void showMessage(String msg, {int duration = 2, MessageType type = MessageType.fail}) async {
  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        elevation: 0,
        width: 300,
        backgroundColor: getBgColor(type),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
        content: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  msg,
                  // maxLines: 5,
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: 50.h,
                width: 50.h,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: AppImage(
                  getToastIcon(type),
                  height: 32.h,
                  width: 32.h,
                  color: getBgColor(type),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime? currentBackPressTime;

Future<void> closePage(String message) async {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = now;
    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
          elevation: 0,
          content: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color(0xffE3E3EC),
          behavior: SnackBarBehavior.floating),
    );
  } else {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}

Color getBgColor(MessageType msgType) {
  return msgType == MessageType.success
      ? const Color(0xff53A653)
      : msgType == MessageType.warning
          ? const Color(0xffFFCC00)
          : const Color(0xffEF233C);
}

String getToastIcon(MessageType msgType) {
  return msgType == MessageType.success
      ? "check.svg"
      : msgType == MessageType.warning
          ? "warning.svg"
          : "danger.svg";
}

Future showPermissions({String? content, required void Function()? onPressed}) async {
  await showDialog(
    builder: (context) => AlertDialog(
      title: Text(LocaleKeys.appName.tr()),
      content: Text(content!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      actions: [
        Row(
          children: [
            ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r), side: BorderSide.none),
                    textStyle: TextStyle(
                      fontSize: 17.sp,
                    )),
                child: Text(LocaleKeys.accept.tr())),
            SizedBox(
              width: 10.w,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(LocaleKeys.cancel.tr())),
          ],
        )
      ],
    ),
    context: navigatorKey.currentContext!,
  );
}

showLoading() {
  showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
            shape: CircleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              PopScope(
                onPopInvoked: (value) {
                  print(value);
                },
                child: Container(
                  color: Colors.transparent,
                  height: 120.h,
                  width: 120.h,
                  child: const AppLoading(),
                ),
              )
            ],
          ));
}
