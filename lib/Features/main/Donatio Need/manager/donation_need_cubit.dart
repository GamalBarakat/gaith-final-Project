import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/core/sharde/dioHelper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/sharde/widget/dialog.dart';
import '../model/donation_need_model.dart';
import 'donation_need_state.dart';

class DonationNeedViewCubit extends Cubit<DonationNeedViewState>{
  DonationNeedViewCubit():super(InitializeDonationNeedViewState());


  void requestADonationForMe ({required String categoryId,
    required String description ,
    required String price , required String details  })  async {

emit(RequestADonationForMeStateLoading());



    DioHelper.postData(url:'need_donation_me',data:{


      'catigory_id': categoryId,
      'dec': description,
      'price': price,
      'des': details,

    } )

        .then((value){

      emit(RequestADonationForMeStateSuccess());


    }).catchError((error)

    {
print('Error in cubit requestADonationForMe ${error.toString()} ');
      emit(RequestADonationForMeStateError(error.toString()));

    }
    );

  }

  File? donationPhoto;
  var pickerPhoto = ImagePicker();

  Future getProfileImageByCamera() async {
    emit(PhotoDonationLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      donationPhoto = File(pickedFile.path );
      emit(PhotoDonationSuccessState());
    } else {
      print('no image selected');
      emit(PhotoDonationErrorState());
    }
  }
  Future getProfileImageByGallery() async {
    emit(PhotoDonationLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      donationPhoto = File(pickedFile.path );
      emit(PhotoDonationSuccessState());
    } else {
      print('no image selected');
      emit(PhotoDonationErrorState());
    }
  }


  void requestADonationToAnotherPerson ({
    required String  name,
    required String address,
    required String phone,
    required String categoryId,
    required String description ,
    required String price ,
    required dynamic  imageUrl,
    required String details  }){

    emit(RequestADonationToAnotherPersonStateLoading());
    DioHelper.postData(url:'need_donation_you',data:{
      'name':name,
      'address':address,
      'phone':phone,
      'catigory_id': categoryId,
      'dec': description,
      'price': price,
      'img': imageUrl,
      'des': details,

    } )

        .then((value){

      emit(RequestADonationToAnotherPersonStateSuccess());


    }).catchError((error)

    {
      print('Error in cubit requestADonationForMe ${error.toString()} ');
      emit(RequestADonationToAnotherPersonStateError(error.toString()));

    }
    );

  }

}
