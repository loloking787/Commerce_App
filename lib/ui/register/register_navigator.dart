  import 'package:flutter/material.dart';

abstract class RegisterNavigator {
  void showLoading();
  void hideLoading();
  void showMessage(String message,
      {String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        bool isDismissible = true
      });
  }