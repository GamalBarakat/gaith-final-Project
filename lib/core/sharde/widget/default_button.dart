

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function function;
  DefaultButton({required this.text,required this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    color:  Colors.white,
    borderRadius: BorderRadius.circular(15.0),
  ),
  width: double.infinity,
  height: 50.h,

  child: MaterialButton(
    onPressed:(){function();},
    child: Text(
      text,
      style:
      TextStyle(
        color: Colors.black,

        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
        fontFamily: 'Cairo',


      ),
    ),
  ),
);
  }
}
