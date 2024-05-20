import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/sharde/chacheHelper.dart';
import '../../../../../core/sharde/widget/consts.dart';
import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/navigation.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';
import '../../../../main/layoutScreen.dart';
import '../../../register/screens/register_screen.dart';
import '../../Cubit/login_view_cubit.dart';
import '../../Cubit/login_view_state.dart';
class FormFieldInLogin  extends StatelessWidget {
  FormFieldInLogin({super.key});
  var keyForm = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) => LoginViewCubit(),
        child: BlocConsumer<LoginViewCubit, LoginViewState>(

          listener: (context, state){
            if (state is LoginViewStateSuccess) {
              if (state.userLoginModel!.status==false) {
                Fluttertoast.showToast(
                    msg: '${state.userLoginModel!.message}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {

                CacheHelper.saveData(
                    key: 'uId', value: state.userLoginModel!.token)
                    .then((value) {
                  uId = CacheHelper.getData(key: 'uId');
                  Fluttertoast.showToast(
                      msg: '${state.userLoginModel!.message}',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  navigatofinsh(context, LayoutScreen(), false);
                });

              }
            }
          },
          builder: (context, state){
          return  Form(
            key: keyForm,
            child: Column(
                children: [


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
                   subfix: IconButton(onPressed: (){
                     BlocProvider.of<LoginViewCubit>(context).changIconPassword();
                   },
                     icon: Icon(BlocProvider.of<LoginViewCubit>(context).subfix,color: Color(0xff931A21 ),size: 30.0),),

                    textInputType: TextInputType.visiblePassword,

                    obscureText:BlocProvider.of<LoginViewCubit>(context).isPassword,
                  ),

                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ConditionalBuilder(
                      condition:state is !LoginViewStateLoading,

                      builder: (context) =>DefaultButton(text: 'تسجيل الدخول',function: (){
                        if (keyForm.currentState!.validate()) {
                          BlocProvider.of<LoginViewCubit>(context).userLogin(

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك حساب؟ ',

                      ),
                      TextButton(
                        onPressed: () {
                          navigato(context, RegisterScreen());
                        },
                        child: Text('تسجيل حساب جديد',
                        ),
                      ),
                    ],
                  ),

                  TextButton(
                    onPressed: () {
                      navigato(context, LayoutScreen());
                    },
                    child: Text('تسجيل الدحول كضيف',
                    ),
                  ),
                ],
              ),
          );
          }


        ),
      );
  }
}