

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomNavigationItem extends StatelessWidget {

  final bool isSelected;
  final String label;
  final Function() onTap;

  const BottomNavigationItem({
    Key? key,

    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: InkWell(
        onTap: () {
          if (isSelected) {
            return;
          }
          onTap();
        },
        child:  Container(

      padding: EdgeInsets.all(5),
          width: 70.w,
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
            color: isSelected ? Colors.green : Colors.grey,
          ),
          child:
        Center(
          child: Center(
            child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: isSelected ? Colors.white : Colors.black,
                      // letterSpacing: -0.5,
                    ),
                  ),
          ),
        ),
        )



      ),
    );
  }
}