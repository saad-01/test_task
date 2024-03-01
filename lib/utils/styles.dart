import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {
  static TextStyle black30() {
    return const TextStyle(
        color: AppColors.blackColor, fontSize: 30, letterSpacing: 2);
  }

  static TextStyle primary10() {
    return const TextStyle(
        color: AppColors.primaryColor, fontSize: 12, letterSpacing: 1);
  }

  static TextStyle white18() {
    return const TextStyle(
      color: AppColors.whiteColor,
      fontSize: 18,
    );
  }

  static TextStyle grey14() {
    return const TextStyle(
      color: AppColors.greyColor,
      fontSize: 14,
    );
  }

  static TextStyle grey8() {
    return const TextStyle(
      color: AppColors.greyColor,
      fontSize: 7,
    );
  }
}
