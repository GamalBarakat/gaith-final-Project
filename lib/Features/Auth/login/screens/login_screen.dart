import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/Auth/login/screens/widget/from_field_in_login.dart';

import '../../../../core/sharde/app_assets.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
        height: MediaQuery.of(context).size.height *.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(25.sp),
              bottomRight:Radius.circular(25.sp),


            )
                ,
          color: Color(0xff529C9C),
        ),


        child: Center(child: Image.asset(AppAssets.logo,width: 100.w,))),
            20.verticalSpace,


            FormFieldInLogin()
            // FormFieldInRegister()
          ],
        ),
      ),
    );
  }
}
