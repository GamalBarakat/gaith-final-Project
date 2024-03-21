import 'package:flutter/material.dart';
import 'package:gaith/core/sharde/app_colors.dart';
import 'package:gaith/core/sharde/widget/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefix;

  final FormFieldValidator<String>? validator;
  const CustomTextFormField({super.key,

  this.controller,
  this.textInputType = TextInputType.text,
  this.hintText,
  this.prefix,

  this.validator,
  }) ;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          decoration: BoxDecoration( color: Color(0xffE0F0FB),
            borderRadius: BorderRadius.circular(10)
          ),
          height: 45,

          child:
          TextFormField(
            controller: controller,

            decoration:  InputDecoration(
              hintText: hintText,
              hintStyle: Styles.textStyleTitleH4,

              border: InputBorder.none,


              contentPadding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 4),


              prefixIcon: prefix,

            ), // textInputAction: textInputAction,
            keyboardType: textInputType,

            validator: validator,
          ),
        ),
      );
  }
}