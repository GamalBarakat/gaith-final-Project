import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/Auth/register/screens/widget/form_field_in_register.dart';
import 'package:gaith/core/sharde/app_assets.dart';

import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/text_forn_field.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset(AppAssets.logo)),
            FormFieldInRegister()
          ],
        ),
      ),
    );
  }
}

