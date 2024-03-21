import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';
class FormFieldInRegister  extends StatelessWidget {
  FormFieldInRegister({super.key});
  var nameController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: 'الاسم',controller: nameController,validator:(value) {
          if (value!.isEmpty) {
            return 'name is  empty';
          } else {
            return null;
          }
        },
          textInputType: TextInputType.name,),

        CustomTextFormField(hintText: 'البريد الإلكتروني',controller: emailController,validator:(value) {
          if (value!.isEmpty) {
            return 'email is  empty';
          } else {
            return null;
          }
        },
          textInputType: TextInputType.emailAddress,),
        CustomTextFormField(hintText: 'كلمة السر',controller:passwordController,validator:(value) {
          if (value!.isEmpty) {
            return 'password is  empty';
          } else {
            return null;
          }
        },
          textInputType: TextInputType.visiblePassword,),
        CustomTextFormField(hintText: 'تأكيد كلمة السر',controller: confirmPasswordController,validator:(value) {
          if (value!.isEmpty) {
            return 'Confirm Password is  empty';
          } else {
            return null;
          }
        },
          textInputType: TextInputType.visiblePassword,),
        CustomTextFormField(hintText: 'رقم الموبايل',controller: mobileNumberController,validator:(value) {
          if (value!.isEmpty) {
            return 'Mobile Number is  empty';
          } else {
            return null;
          }
        },
          textInputType: TextInputType.phone,),
        CustomTextFormField(hintText: 'العنوان',controller: addressController,validator:(value) {
          if (value!.isEmpty) {
            return 'address is  empty';
          } else {
            return null;
          }
        },
          textInputType: TextInputType.streetAddress,),
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(text: 'إنشاء حساب',function: (){},),
        )
      ],
    );
  }
}