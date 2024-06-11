import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/drawer/cart/widget/card_cart.dart';
import 'package:gaith/core/sharde/app_assets.dart';

import '../../main/donor/cubit/home_view_cubit.dart';
import '../../main/donor/cubit/home_view_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F6FE),
        body:
        BlocProvider(
            create: (context) => DonorViewCubit()..getCartAll(),
            child: BlocConsumer<DonorViewCubit, DonorViewState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return BlocProvider.of<DonorViewCubit>(context).cartModel ==
                          null
                      ? Text('ff')
                      : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = BlocProvider.of<DonorViewCubit>(context).cartModel!.carts![index];
                      return DismissibleTile(
                        ltrBackground: const ColoredBox(color: Colors.yellowAccent),
                        key: Key(item.toString()),
                          padding:EdgeInsets.all(5.0),

                        onDismissed: (direction) {
                          BlocProvider.of<DonorViewCubit>(context).deleteItemInCart(donationId: item.id!);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${item.price} dismissed')),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          child: CardCart(
                            idDonation: item.id!,
                            image: item.img!,
                            price: item.price!,
                          ),
                        ),
                      );
                          },
                          itemCount:BlocProvider.of<DonorViewCubit>(context).cartModel!.carts!.length,
                        );
                })));
  }
}
