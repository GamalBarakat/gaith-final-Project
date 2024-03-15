

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Donate Quickly/favorite_page.dart';
import '../../../Donatio Need/donation_need.dart';
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

  List <String>titeleappbar=[
    'متبرع',
    'محتاج تبرع',
    'تبرع سريع',
    'متطوع',
    'محفظه',

  ];

  List<Widget>Scrreen = [
    DonorPage(),
    DonationNeedPage(),
    DonateQuicklyPage(),
    VolunteerPage(),
    WalletPage(),
  ];






}


