

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function function;
  DefaultButton({required this.text,required this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    color:  AppColors.buttonColor,
    borderRadius: BorderRadius.circular(8.0),
  ),
  width: double.infinity,
  height: 40.h,

  child: MaterialButton(
    onPressed:(){function();},
    child: Text(
      text,

      style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: 'Tajawal',
    ),


      ),

  ),
);
  }
}
