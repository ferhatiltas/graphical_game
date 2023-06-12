import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/font_constants.dart';


class CustomSnackBar {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Color borderColor,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.only(bottom: 80.h, right: 2.w, left: 2.w),
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.h)),
            color: backgroundColor,
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 1.h, bottom: 1.h),
                      child: Icon(
                        icon,
                        color: borderColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        message,
                        style: TextStyle(color: borderColor, fontSize: 12.sp, fontFamily: FontsConstants.instance.AVENIR_MEDIUM),
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                  child: Icon(Icons.close, color: borderColor), onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
            ],
          ),
        ),
      ),
    );
  }
}
