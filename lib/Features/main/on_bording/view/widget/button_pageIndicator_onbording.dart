import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../onBordingScreesn.dart';

class ButtonPageIndicatorOnBording extends StatelessWidget {
  int textButton;
  Function submit;
  bool isLast;

  ButtonPageIndicatorOnBording({super.key,required this.isLast,required this.textButton,required this.submit});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        bordcontroll.nextPage(
          duration: const Duration(
            milliseconds: 750,
          ),
          curve: Curves.easeInCubic,
        );
        if (isLast == true) {
          submit();
        }
      },
      child:   Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0.r)
        ),
        height: 50.h,
        width: 50.w,
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}