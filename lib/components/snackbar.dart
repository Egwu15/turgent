import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:get/route_manager.dart';

showCustomSnackBar(displayText) {
  Get.showSnackbar(GetBar(
    duration: Duration(seconds: 2),
    messageText: Center(
        child: Text(
      displayText,
      style: TextStyle(color: Colors.white),
    )),
  ));
}
