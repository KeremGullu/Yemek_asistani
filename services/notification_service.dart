import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationService {
  static Future<void> initialize() async {
    // Toast için başlatma gerekmiyor
  }

  static void showNotification({
    required String title,
    required String body,
  }) {
    Fluttertoast.showToast(
      msg: "$title\n$body",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 4,
      backgroundColor: Color(0xFF7C4DFF),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future<bool> requestPermission() async {
    // Toast için izin gerekmiyor
    return true;
  }
} 