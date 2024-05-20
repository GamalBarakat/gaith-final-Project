




import 'dart:io';


import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Donate Quickly/favorite_page.dart';
import '../../../Donatio Need/views/donation_need.dart';
import '../../../Volunteer/volunteer.dart';
import '../../../donor/donor.dart';
import '../../../wallet/wallet_page.dart';
import 'home_view__state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() :super(InitializeHomeViewState());
  int CurrentIndex = 0;

  void Changecurrentindex(int index) {
    CurrentIndex = index;
    emit(LayoutBottomNavBarState());
  }

  List <String>titeleappbar = [
    'متبرع',
    'محتاج تبرع',
    'تبرع سريع',
    'فرص التطوع',
    'محفظه',

  ];

  List<Widget>Scrreen = [
    DonorPage(),
    DonationNeedPage(),
    DonateQuicklyPage(),
    VolunteerPage(),
    WalletPage(),
  ];


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

}



