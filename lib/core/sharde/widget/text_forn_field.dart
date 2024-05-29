import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefix;
  final Widget? subfix;
  final dynamic obscureText;
  final FormFieldValidator<String>? validator;
  const CustomTextFormField({super.key,
  this.controller,
  this.textInputType = TextInputType.text,
  this.hintText,
  this.prefix,
  this.validator,
    this.subfix,
    this.obscureText
  }) ;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          decoration:  InputDecoration(
            suffixIcon:subfix,

            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,width: 1.2),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(

            color: Color(0xff555555),

            fontFamily: 'Rajawali'),

            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 50),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),

            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(

              borderSide: BorderSide(color: Colors.green),
            ),

            contentPadding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),


            prefixIcon: prefix,

          ), // textInputAction: textInputAction,
          keyboardType: textInputType,

          validator: validator,
          obscureText: obscureText == null ? false : obscureText,
        ),
      );
  }
}