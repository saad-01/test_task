import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class NameItem extends StatelessWidget {
  const NameItem({super.key, required this.name, required this.number});
  final String name;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 5),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(6), // Set the border radius
                    border: Border.all(
                      color: AppColors.borderColor, // Set the border color
                      width: 1, // Set the border width
                    ),
                  ),
                  child: Center(
                      child: Text(
                    name,
                    style: Styles.grey14(),
                  )),
                ),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.circular(6), // Set the border radius
                      border: Border.all(
                        color: AppColors.borderColor, // Set the border color
                        width: 1, // Set the border width
                      ),
                    ),
                    child: Center(
                        child: Text(
                      number,
                      style: Styles.grey8(),
                    )),
                  ))
            ],
          );
  }
}