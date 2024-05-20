




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/sharde/dioHelper.dart';
import '../model/user_login_model.dart';
import 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState>{
  LoginViewCubit():super(InitializeLoginViewState());

  bool isPassword=true;
  IconData subfix= Icons.visibility_off;
  void changIconPassword()
  {
    isPassword=!isPassword;
    subfix=isPassword?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }


  UserLoginModel? userLoginModel;
  void userLogin({required String email,required String password})
  {
    emit(LoginViewStateLoading ());
    DioHelper.postData(url:'login' , data: {
      'email':email,
      'password':password,


    }).then((value){
print(value.data);
       userLoginModel = UserLoginModel.fromJson(value.data);


       emit(LoginViewStateSuccess(userLoginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginViewStateError(error.toString()));
    });
  }





}



  
  
