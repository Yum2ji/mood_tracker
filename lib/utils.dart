import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

String getTimeAgo(String createdDate) {
  // String을 DateTime으로 변환
  DateTime postDateTime = DateTime.parse(createdDate);

  // 현재 시간 가져오기
  DateTime now = DateTime.now();

  // 두 날짜의 차이 계산
  Duration difference = now.difference(postDateTime);

  if (difference.inDays > 0) {
    return '${difference.inDays} days ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} mins ago';
  } else {
    return 'now';
  }
}


String formatDateTime() {

  String formattedDate = DateFormat('yyyyMMddHHmmssSSS').format(DateTime.now()).toString();
  return formattedDate;
}

showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
/*       action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ), */
      content: Text(
        (error as FirebaseException).message ?? "Something went wrong",
      ),
    ),
  );
}
