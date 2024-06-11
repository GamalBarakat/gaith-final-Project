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
    required String price , required String details, required String image })  async {

emit(RequestADonationForMeStateLoading());

FormData formData = FormData.fromMap({
  'files': [
    await MultipartFile.fromFile('${image}', filename: 'gggg')
  ],
  'catigory_id': categoryId,
  'dec': description,
  'price': price,
  'des': details,


});

    DioHelper.postData(url:'need_donation_me',data:formData )

        .then((value){
print(value.data);
print(image);
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


  Future<void> requestADonationToAnotherPerson ({
    required String  name,
    required String address,
    required String phone,
    required String categoryId,
    required String description ,
    required String price ,
    required dynamic  imageUrl,
    required String details  }) async {

    emit(RequestADonationToAnotherPersonStateLoading());
    FormData formData = FormData.fromMap({
      'files': [
        await MultipartFile.fromFile('${imageUrl}', filename: '')
      ],
      'catigory_id': '3',
      'dec': description,
      'price': price,
      'des': description,
      'name':name,
      'address':address,
      'phone':phone,
      'img': '/data/user/0/com.example.gaith/cache/f1d454a9-e85e-46d6-ae60-db9ccf254b71/IMG-20210305-WA0005.jpg',

    });
    DioHelper.postData(url:'need_donation_you',data:formData)

        .then((value){
print(value.data);
print(imageUrl);
      emit(RequestADonationToAnotherPersonStateSuccess());


    }).catchError((error)

    {
      print('Error in cubit requestADonationForMe ${error.toString()} ');
      emit(RequestADonationToAnotherPersonStateError(error.toString()));

    }
    );

  }

}
