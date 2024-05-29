import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/navigation.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';

import '../../../login/screens/login_screen.dart';
import '../../Cubit/register_view_cubit.dart';
import '../../Cubit/register_view_state.dart';

class FormFieldInRegister extends StatelessWidget {
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
    return BlocProvider(
      create: (context) => RegisterViewCubit(),
      child: BlocConsumer<RegisterViewCubit, RegisterViewState>(
          listener: (context, state) {
        if (state is RegisterViewStateSuccess) {
          if (state.registerModel!.status == false) {
            Fluttertoast.showToast(
                msg: '${state.registerModel!.message}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {

            Fluttertoast.showToast(
                msg: '${state.registerModel!.message}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
           navigato(context, LoginScreen());
          }
        }
      }, builder: (context, state) {
        return
          Form(
            key: keyForm,
            child: Column(
            children: [
              CustomTextFormField(
                hintText: 'الاسم',
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.name,
              ),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hintText: 'كلمة السر',
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.visiblePassword,
              ),
              CustomTextFormField(
                hintText: 'تأكيد كلمة السر',
                controller: confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm Password is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.visiblePassword,
              ),
              CustomTextFormField(
                hintText: 'رقم الموبايل',
                controller: mobileNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mobile Number is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.phone,
              ),
              CustomTextFormField(
                hintText: 'العنوان',
                controller: addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'address is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.streetAddress,
              ),
              20.verticalSpace,

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConditionalBuilder(
                  condition:state is !RegisterViewStateLoading,

                  builder: (context) =>DefaultButton(text: 'إنشاء حساب',function: (){
                    if (keyForm.currentState!.validate()) {
                      BlocProvider.of<RegisterViewCubit>(context).userRegister(
                        address: addressController.text,
                          name:nameController.text ,

                          phone:mobileNumberController.text ,

                          password_confirmation:confirmPasswordController.text ,


                          email:emailController.text,

                          password: passwordController.text

                      );
                    }

                  },),
                  fallback:(context) => const Center(child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Colors.black,
                    color: Colors.blue,

                    semanticsLabel: 'Linear progress indicator',

                  ) ,

                  ),
                ),

              ),

            ],
        ),
          );
      }),
    );
  }
}
