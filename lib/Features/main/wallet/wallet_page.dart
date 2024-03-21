import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/sharde/app_assets.dart';
class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
              width: 120.w,
              AppAssets.volunter),
        ),
        Center(
          child: Text(
            'تمت عمليه الدفع بنجاح',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 70.h),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // print(totalPrice);
              // print(todayDate);
              // print(selectedTime);
              // print(todayName);
              //
              // print('apartment ${widget.apartmentControllerCheckOutOnSystem}');
              // print(
              //     '${Day["${DateFormat.EEEE().format(today)}"]}');
              //
              // if (_formKey.currentState!
              //     .validate()) {
              //   (UserPhone != null)
              //       ? orderItemFun
              //       .orderItemFu(
              //     DistriictName: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["DistrictName"],
              //     context: context,
              //     OrderDate: DateFormat(
              //         'yyyy-MM-dd')
              //         .format(_timeData)
              //         .toString(),
              //     CustomerAddress: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     [
              //     "CustomerAddress"],
              //     CustomerPhone: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["CustomerPhone"],
              //     CustomerName: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["ArabicName"],
              //     Block: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["Block"],
              //     Street: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["StreetName"],
              //     House: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["HouseNo"],
              //     DiscountCode:
              //     discountValueControllerCheckOutOnSystem.text,
              //     Gada: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["Gada"],
              //     Floor: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["Floor"],
              //     Apartment: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["Apartment"],
              //     Email: listAddressUser
              //         .dataAddressList[
              //     selectAddress]
              //     ["Email"],
              //     DeliveryID:
              //     DeliveryId,
              //     Details:
              //     widget.titleNotes,
              //     DeliveryDate:
              //     todayDate,
              //     DeliveryDay:
              //     todayName,
              //     OrderTime:
              //     selectedTime,
              //     TotalValue:
              //     totalPrice,
              //     Additions: ((UserPhone==null) ?widget.DeliveryValue:deleveryValue??0.5),
              //     Discount: widget.discountValue,
              //     FinalValue:  (FinalPrice == 0.0)
              //         ? roundToDecimal((totalPrice + widget.DeliveryValue), 2)
              //         : roundToDecimal(FinalPrice,2),
              //     PayID: selectedOption,
              //     OnlineStoreId: -1,
              //     orderList:
              //     widget.newmyList,
              //     Image:
              //     listItemOrderImage
              //         .orderListImage,
              //   )
              //       : orderItemFun
              //       .orderItemFu(
              //     DistriictName: widget
              //         .ValueselectedDistrict,
              //     context: context,
              //     OrderDate: DateFormat(
              //         'yyyy-MM-dd')
              //         .format(_timeData)
              //         .toString(),
              //     CustomerPhone: widget
              //         .mobileNumberControllerCheckOutOnSystem,
              //     CustomerName: widget
              //         .nameControllerCheckOutOnSystem,
              //     Block: widget
              //         .BlockNumberControllerCheckOutOnSystem,
              //     Street: widget
              //         .StreetControllerCheckOutOnSystem,
              //     House: widget
              //         .HouseControllerCheckOutOnSystem,
              //     Gada: widget.gada,
              //     Floor: widget
              //         .floorControllerCheckOutOnSystem,
              //     Apartment: widget
              //         .apartmentControllerCheckOutOnSystem,
              //     Email: widget
              //         .emailControllerCheckOutOnSystem,
              //     DeliveryID:
              //     DeliveryId,
              //     DiscountCode:
              //     discountValueControllerCheckOutOnSystem.text,
              //     Details:
              //     widget.titleNotes,
              //     DeliveryDate:
              //     todayDate,
              //     DeliveryDay:
              //     todayName,
              //     OrderTime:
              //     selectedTime,
              //     TotalValue:
              //     totalPrice,
              //     Additions: ((UserPhone==null) ?widget.DeliveryValue:deleveryValue??0.5),
              //     Discount: (widget
              //         .discountValue ==
              //         0.0)
              //         ? widget
              //         .DiscountPercent
              //         : widget
              //         .discountValue,
              //     FinalValue:  (FinalPrice == 0.0)
              //         ? (totalPrice + widget.DeliveryValue)
              //         : FinalPrice,
              //     PayID: selectedOption,
              //     OnlineStoreId: -1,
              //     orderList:
              //     widget.newmyList,
              //     Image:
              //     listItemOrderImage
              //         .orderListImage,
              //   );
              // }
              //
              // print(widget.newmyList);
              // print(_timeData);
              // print(selectedTime);
              // print(dayNameAr!);
              // //  listItemOrder.clearItems();
            },
            style: ElevatedButton.styleFrom(

              backgroundColor:Colors.orange,
            ),
            child: Text('الـمـتـابـعـة',style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
