import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/restaurantDetailScreen/restaurant_gallery_screen.dart';
import '../../common/common_widget/wiletone_image_widget.dart';
import '../../utils/enum_utils.dart';
import '../payment/payment_success_screen.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {

  RxList time = [
    '7 AM - 10 AM',
    '10 AM - 12 PM',
    '12 PM - 3 PM',

    '3 PM - 7 PM',
    '7 PM - 10 PM',
    '10 PM - 12 AM',
  ].obs;

  Rx<TextEditingController> amountcontroller = TextEditingController().obs;
  int? selectedOption;
   int? selectedindex;

  @override
  Widget build(BuildContext context){

    return Scaffold(

      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    ///First Half
                    InkWell(
                      onTap: () {
                        Get.to(() => const RestaurantGalleryScreen());
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3.h,
                        width: Get.width.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppIconAssets.frame4),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width <= 280 ? 5.w : 15.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),

                              ///Back Arrow and share

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: Row(
                                  children: [

                                    /// Back Button
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: CircleAvatar(
                                        radius: 18.r,
                                        backgroundColor: ColorUtils.white,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 5.h),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              size: 18.h,
                                            )),
                                      ),
                                    ),
                                    const Spacer(),
                                    CircleAvatar(
                                      radius: 18.r,
                                      backgroundColor: ColorUtils.white,
                                      child: Center(
                                          child: Image.asset(
                                              AppIconAssets.shareIcon)),
                                    ),

                                  ],
                                ),
                              ),

                              const Spacer(),

                              ///Gallery

                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 10.h, bottom: 15.h),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: Get.height * 0.04.h,
                                      width: Get.width <= 280 ? 70.w : 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Row(
                                        mainAxisAlignment :  MainAxisAlignment.center,
                                        children: [

                                           SizedBox(

                                            child: WileToneImageWidget(
                                              image: AppIconAssets.gallery,
                                              imageType: ImageType.png,
                                              // height: 70.h,
                                              width: Get.width <= 280 ? 20.w :  25.w,


                                            ),
                                          ),

                                          SizedBox(
                                            width: 4.h,
                                          ),

                                          WileToneTextWidget(
                                            title: VariablesUtils.gallery,
                                            fontSize: Get.width <= 280 ? 10.w :  13.w,
                                            color: ColorUtils.white,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///Second Half
                    SizedBox(
                      height: 62.h,
                    ),

                    WileToneTextWidget(
                      title: 'Sheetal Hotel',
                      fontFamily: AssetsUtils.inter,
                      fontSize: 32.sp,
                      color: ColorUtils.black,
                      fontWeight: FontWeight.w700,
                    ),

                    WileToneTextWidget(
                      title: 'Rohan corner, Bibwewadi',
                      fontFamily: AssetsUtils.inter,
                      fontSize: 12.sp,
                      color: ColorUtils.grey5B,
                      fontWeight: FontWeight.w500,
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    ///Paybill, Offers, and About
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorColor: ColorUtils.lightblack,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: ColorUtils.grey5B,
                          labelColor: ColorUtils.lightblack,
                          labelStyle: TextStyle(
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          unselectedLabelStyle: TextStyle(
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          tabs: const [
                            Tab(
                              text: VariablesUtils.paybill,
                            ),
                            Tab(
                              text: VariablesUtils.offers,
                            ),
                            Tab(
                              text: VariablesUtils.about,
                            ),
                          ]),
                    ),

                    SizedBox(
                        // color: Colors.blue,
                        height: Get.height / 2.h,
                        child: TabBarView(
                            children: [

                              ///PayBill View
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: <Widget>[

                                SizedBox(
                                  height: 22.h,
                                ),

                                ///Amount Field
                                Row(
                                  children : [
                                    WileToneTextWidget(
                                      title : VariablesUtils.billAmount,
                                      fontFamily: AssetsUtils.poppins,
                                      fontSize: 14.sp,
                                      color: ColorUtils.lightblack,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      width: Get.width / 10.w,
                                    ),
                                    Expanded(
                                        child: WileToneTextFormField(
                                            isValidate: true,
                                            textInputType: TextInputType.number,
                                            hintText:
                                                VariablesUtils.enterAmount,
                                            borderSide: const BorderSide(
                                                color: ColorUtils.lightGreyA6),
                                            controller: amountcontroller.value))
                                  ],
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),

                                ///Discount Field
                                Container(
                                  height : Get.height / 14.h,
                                  width : MediaQuery.of(context).size.width.w * 1.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border:
                                          Border.all(color: ColorUtils.green)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        WileToneTextWidget(
                                          title: VariablesUtils.discount,
                                          fontFamily: AssetsUtils.poppins,
                                          fontSize: 13.sp,
                                          color: ColorUtils.lightblack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Container(
                                          height: 18.h,
                                          width: Get.width * 0.1.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: ColorUtils.red),
                                          child: WileToneTextWidget(
                                            title: '10\%',
                                            fontFamily: AssetsUtils.poppins,
                                            fontSize: 10.sp,
                                            color: ColorUtils.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        Radio(
                                            activeColor: ColorUtils.green,
                                            value: 1,
                                            groupValue: selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedOption = value;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 12.h,
                                ),

                                ///Coupon Field
                                Container(
                                  height : Get.height / 14.h,
                                  width : MediaQuery.of(context).size.width .w * 1.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: ColorUtils.lightGreyD3)),
                                  child: Padding(
                                    padding : EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            AppIconAssets.discountIcons),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        WileToneTextWidget(
                                          title: VariablesUtils.magicCoupon,
                                          fontFamily: AssetsUtils.poppins,
                                          fontSize: 13.sp,
                                          color: ColorUtils.lightblack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        WileToneTextWidget(
                                          title:
                                              "(${VariablesUtils.extra} 1\% ${VariablesUtils.off2})",
                                          fontFamily: AssetsUtils.poppins,
                                          fontSize: 13.sp,
                                          color: ColorUtils.lightblack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Spacer(),
                                        Radio(
                                            activeColor: ColorUtils.green,
                                            value: 2,
                                            groupValue: selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedOption = value;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 15.h,
                                ),

                                ///Pay Button
                                WileToneCustomButton(
                                  buttonHeight: 52.h,
                                  buttonWidth: Get.width,
                                  buttonRadius: 25.r,
                                  buttonColor: ColorUtils.green,
                                  onPressed: () {
                                    _showAmountData(context);
                                  },
                                  buttonName: VariablesUtils.pay,
                                  fontSize: 16.sp,
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),

                              ],
                            ),
                          ),

                          /// Offer view
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                WileToneTextWidget(
                                  title: VariablesUtils.offerstore,
                                  fontSize: 16.sp,
                                  fontFamily: AssetsUtils.inter,
                                  fontWeight: FontWeight.w700,
                                  color: ColorUtils.grey5B,
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),

                                WileToneTextWidget(
                                  title: VariablesUtils.off20,
                                  fontSize: 30.sp,
                                  fontFamily: AssetsUtils.poppins,
                                  fontWeight: FontWeight.w600,
                                  color: ColorUtils.green,
                                ),

                                /// Speener
                                SizedBox(
                                  height: 190.h,
                                  child: ListWheelScrollView(
                                    onSelectedItemChanged: (index) {
                                       selectedindex = index;
                                      log("selectedindex :- $selectedindex");
                                    },

                                    itemExtent: 29,
                                    useMagnifier: true,
                                    magnification: 1.5,
                                    children :  [

                                      for(int index = 0;index < time.length;index++)

                                        WileToneTextWidget(
                                        title: time[index].toString(),
                                        fontSize: 16.sp,
                                        fontFamily: AssetsUtils.inter,
                                        fontWeight: FontWeight.w600,
                                        // color: selectedindex == index ? ColorUtils.black : ColorUtils.grey,
                                      ),

                                      SizedBox(
                                        height: 10.h,
                                      ),

                                      // const Text("10 AM - 12 PM"),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // const Text("12 PM - 3 PM"),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // const Text("3 PM - 7 PM"),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // const Text("7 PM - 10 PM"),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // WileToneTextWidget(
                                      //   title: '10 PM - 12 AM',
                                      //   fontSize: 16.sp,
                                      //   fontFamily: AssetsUtils.inter,
                                      //   fontWeight: FontWeight.w600,
                                      //   color: ColorUtils.black,
                                      // ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          /// About view
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 15.h,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: WileToneTextWidget(
                                    title: VariablesUtils.cuisine,
                                    fontSize: 14.sp,
                                    fontFamily: AssetsUtils.poppins,
                                    fontWeight: FontWeight.w600,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: WileToneTextWidget(
                                    title: VariablesUtils.foodregion,
                                    fontSize: 12.sp,
                                    fontFamily: AssetsUtils.poppins,
                                    fontWeight: FontWeight.w500,
                                    color: ColorUtils.grey5B,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: WileToneTextWidget(
                                    title: VariablesUtils.about,
                                    fontSize: 14.sp,
                                    fontFamily: AssetsUtils.poppins,
                                    fontWeight: FontWeight.w600,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  height: 153.h,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                          color: ColorUtils.greyEC,
                                          width: 1.w)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          const WileToneImageWidget(
                                            image: AppIconAssets.place,
                                            imageType: ImageType.png,
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          WileToneTextWidget(
                                            title: VariablesUtils.address,
                                            fontSize: 12.sp,
                                            fontFamily: AssetsUtils.poppins,
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.grey5B,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      const Divider(
                                        color: ColorUtils.greyEC,
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          const WileToneImageWidget(
                                            image: AppIconAssets.directlocation,
                                            imageType: ImageType.png,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          WileToneTextWidget(
                                            title: VariablesUtils.getdirection,
                                            fontSize: 12.sp,
                                            fontFamily: AssetsUtils.poppins,
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.grey5B,
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Container(
                                            height: 24.h,
                                            width: 1.w,
                                            color: ColorUtils.greyEC,
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          const WileToneImageWidget(
                                            image: AppIconAssets.callhotel,
                                            imageType: ImageType.png,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          WileToneTextWidget(
                                            title:
                                                VariablesUtils.callrestaurant,
                                            fontSize: 12.sp,
                                            fontFamily: AssetsUtils.poppins,
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.grey5B,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                        ]))
                  ],
                ),
              ),

              Positioned(
                top : MediaQuery.of(context).size.height / 3.299.h,
                left : MediaQuery.of(context).size.width/ 3.1.w,
                child : SizedBox(
                  height : Get.width <= 280  ?  50.h : 75.h,
                  width : Get.width <= 280  ?   50.w : 75.w,
                  child : const WileToneImageWidget(
                    image : AppIconAssets.frame2,
                    imageType : ImageType.png,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showAmountData(BuildContext context){

    showModalBottomSheet<void>(
      shape : RoundedRectangleBorder(
        borderRadius : BorderRadius.only(
            topLeft : Radius.circular(10.r), topRight : Radius.circular(10.r)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            width: Get.width.w,
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 16.h,
                      ),

                      ///Summary
                      WileToneTextWidget(
                        title: VariablesUtils.summary,
                        fontSize: 14.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(
                        color: ColorUtils.lightGreyA6,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///Bill Amount
                      Row(
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.billAmount,
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                          const Spacer(),
                          WileToneTextWidget(
                            title: '\₹1,000',
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///Discount
                      Row(
                        children: [
                          WileToneTextWidget(
                            title: "${VariablesUtils.discount}(10\%)",
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.green,
                          ),
                          const Spacer(),
                          WileToneTextWidget(
                            title: '-\₹100',
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.green,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      const Divider(
                        color: ColorUtils.lightGreyA6,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      ///Total Amount
                      Row(
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.payOnly,
                            fontSize: 15.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                          const Spacer(),
                          WileToneTextWidget(
                            title: '\₹900',
                            fontSize: 15.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: Get.height / 6.h,
                      ),

                      ///Pay Button
                      WileToneCustomButton(
                        buttonHeight: 52.h,
                        buttonWidth: Get.width.w,
                        buttonRadius: 25.sp,
                        buttonColor: ColorUtils.green,
                        onPressed: () {
                          Get.to(() => const PaymentSuccessScreen());
                        },
                        buttonName: "${VariablesUtils.pay}\₹900",
                        fontSize: 16,
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
