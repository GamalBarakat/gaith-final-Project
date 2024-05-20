



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'home/feature/manager/home_cubite.dart';
import 'home/feature/manager/home_view__state.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit(),
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return
            Scaffold(





                bottomNavigationBar: SalomonBottomBar(
                  curve: Curves.easeOutQuint,
                  currentIndex: BlocProvider.of<HomeViewCubit>(context).CurrentIndex,
                  onTap: (index) {
                    BlocProvider.of<HomeViewCubit>(context).Changecurrentindex(index);
                  },
                  items: [
                    SalomonBottomBarItem(
                      icon: Icon(Icons.home),

                      title: const Text("الصفحه الرئسيه"),
                      selectedColor: Colors.green,
                      unselectedColor: Colors.green
                    ),


                    SalomonBottomBarItem(
                      icon: Icon(Icons.favorite_border),
                      title: Text("Likes"),
                      selectedColor: Colors.pink,
                    ),

                    /// Search
                    SalomonBottomBarItem(
                      icon: Icon(Icons.search),
                      title: Text("Search"),
                      selectedColor: Colors.orange,
                    ),

                    /// Profile
                    SalomonBottomBarItem(
                      icon: Icon(Icons.person),
                      title: Text("Profile"),
                      selectedColor: Colors.teal,
                    ),
                  ],


                ),
                body: SafeArea(
                  child: BlocProvider
                      .of<HomeViewCubit>(context)
                      .Scrreen[BlocProvider
                      .of<HomeViewCubit>(context)
                      .CurrentIndex],
                )


            );
        },
      ),);
  }
}









