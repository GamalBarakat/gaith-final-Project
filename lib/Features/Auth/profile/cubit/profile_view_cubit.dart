import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/Auth/profile/cubit/profile_view_state.dart';
import 'package:gaith/core/sharde/dioHelper.dart';

import '../model/edit_profile_model.dart';
import '../model/profile_model.dart';

class ProfileViewCubit extends Cubit<ProfileViewState>{
  ProfileViewCubit():super(InitializeProfileViewState());


  ProfileModel?profileModel;
  void getDataProfile(){
    emit(ProfileViewStateLoading());
    DioHelper.getData(url: 'get_profile').then((value){

      profileModel=ProfileModel.fromJson(value.data);
     print(value.data);

      emit(ProfileViewStateSuccess());
    }).catchError((error)

    {

      print('Error this is Get Profile ${error.toString()}');

      emit(ProfileViewStateError());
    }
    );
    
    
  }

  EditProfile ?editProfile;
  void editeProfileData({required String }){
    emit(EditProfileViewStateLoading());
    DioHelper.postData(url: 'edit_profile').then((value){

      editProfile=EditProfile.fromJson(value.data);
      print(value.data);

      emit(EditProfileViewStateSuccess());
    }).catchError((error)

    {

      print('Error this is Edit  Profile ${error.toString()}');

      emit(EditProfileViewStateError());
    }
    );

  }


  }

