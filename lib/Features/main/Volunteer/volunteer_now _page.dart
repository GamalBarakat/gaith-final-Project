import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/text_forn_field.dart';
class VolunteerNowPage extends StatelessWidget {
  var nameController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  var addressController = TextEditingController();
  var ageController = TextEditingController();
  var occupationController = TextEditingController();
  var experienceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text('متطوع',style:
          TextStyle(
            color: Colors.black,

            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
            fontFamily: 'Cairo',


          ),),



        ),
        body:
        Column(
          children: [

            20.verticalSpace,
            CustomTextFormField(hintText: 'الاسم',controller: nameController,validator:(value) {
      if (value!.isEmpty) {
      return 'name is  empty';
      } else {
      return null;
      }
      },
            textInputType: TextInputType.name,),
            CustomTextFormField(hintText: 'العنوان',controller: addressController,validator:(value) {
              if (value!.isEmpty) {
                return 'address is  empty';
              } else {
                return null;
              }
            },
              textInputType: TextInputType.streetAddress,),
            CustomTextFormField(hintText: 'العمر',controller: ageController,validator:(value) {
              if (value!.isEmpty) {
                return 'age is  empty';
              } else {
                return null;
              }
            },
              textInputType: TextInputType.number,),
            CustomTextFormField(hintText: 'المهنه',controller:occupationController,validator:(value) {
              if (value!.isEmpty) {
                return 'occupation is  empty';
              } else {
                return null;
              }
            },
              textInputType: TextInputType.text,),
            CustomTextFormField(hintText: 'الخبرات',controller: experienceController,validator:(value) {
              if (value!.isEmpty) {
                return 'experience is  empty';
              } else {
                return null;
              }
            },
              textInputType: TextInputType.text,),

            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultButton(text: 'تأكيد',function: (){},),
            )
          ],
        )
      )
     ;
  }
}
