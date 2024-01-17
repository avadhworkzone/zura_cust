import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/common_widget/wiletone_custom_button.dart';
import '../../common/common_widget/wiletone_image_widget.dart';
import '../../common/common_widget/wiletone_text_form_field.dart';
import '../../common/common_widget/wiletone_text_widget.dart';
import '../../utils/app_icon_assets.dart';
import '../../utils/assets/assets_utils.dart';
import '../../utils/color_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/variables_utils.dart';
import '../dashboard/all_brands.dart';
import '../dashboard/reward_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static Rx<TextEditingController> searchstores = TextEditingController().obs;
  static List imagename = [
    'Restaurant',
    'Cafe',
    'Sweet Shop',
    'Salon',
    'Stationery',
    'Pharmacy',
    'Fitness',
    'Fashion',
  ];

  String? RestaurantTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(padding : EdgeInsets.symmetric(horizontal: 15.w,),
        child : Column(
          children : [

            SizedBox(
              height : 190.h,
              width : Get.width.w,
              child : Column(
                children : [

                  /// Top App bar
                  Container(
                    width: double.infinity.w,
                    height: 102.h,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFCFAEF),
                            Color(0xFFE8FFDF)
                          ], // Change colors as needed

                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          // stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.sp),
                            bottomRight: Radius.circular(30.sp))),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),

                          /// person icon
                          WileToneImageWidget(
                            // color: ColorUtils.lightGreyA6,
                            image: AppIconAssets.personicon,
                            imageType: ImageType.png,
                            height: 38.h,
                            width: 38.w,
                          ),

                          SizedBox(
                            width: 15.w,
                          ),

                          /// Ruppes value
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              WileToneTextWidget(
                                title: VariablesUtils.saved,
                                fontSize: 10.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black,
                              ),
                              WileToneTextWidget(
                                title: VariablesUtils.ruppes,
                                fontSize: 24.sp,
                                fontFamily: AssetsUtils.metrophobic,
                                fontWeight: FontWeight.w700,
                                color: ColorUtils.black,
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 70.w,
                          ),

                          /// reward icon
                          InkWell(
                            onTap: (){
                              Get.to(const RewardScreen());
                            },
                            child: Container(
                              width: 113.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(38.sp),
                                      bottomLeft: Radius.circular(38.sp),
                                      bottomRight: Radius.circular(38.sp),
                                      topRight: Radius.circular(38.sp))),
                              child: Row(
                                children: [

                                  WileToneImageWidget(
                                    image: AppIconAssets.reward,
                                    imageType: ImageType.png,
                                    height: 38.h,
                                    width: 38.w,
                                  ),
                                  WileToneTextWidget(
                                    title: VariablesUtils.reward,
                                    fontSize: 12.sp,
                                    fontFamily: AssetsUtils.poppins,
                                    fontWeight: FontWeight.w500,
                                    color: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  /// Textfield search Stores
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.sp),
                    child: InkWell(
                      onTap: (){
                        Get.to(const AllBrandsScreen());
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: WileToneTextFormField(
                          controller: searchstores.value,
                          pIcon: WileToneImageWidget(
                            color: ColorUtils.lightGreyA6,
                            image: AppIconAssets.searchoicon,
                            imageType: ImageType.png,
                            height: 52.h,
                            // width: 24.w,
                          ),
                          filled: false,
                          height: 52.h,
                          borderSide: const BorderSide(color: ColorUtils.lightGreyD7),
                          borderRadius: 57.sp,
                          hintText: VariablesUtils.searchstores,
                          hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: ColorUtils.lightGreyA6,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 20.h,
            ),

            Expanded(
              child : ListView(
                shrinkWrap : true,
                children : [

                  Align(
                    alignment: Alignment.topLeft,
                    child: WileToneTextWidget(
                      title: VariablesUtils.shop,
                      fontSize: 16.sp,
                      fontFamily: AssetsUtils.poppins,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black,
                    ),
                  ),

                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                    shrinkWrap: true,
                    itemCount: 8,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 15.h),
                        minVerticalPadding: 0,
                        title: Align(
                          alignment: Alignment.bottomCenter,
                          child: WileToneImageWidget(
                            image: AppIconAssets.hotelimages[index].toString(),
                            imageType: ImageType.png,
                            height: 70.h,
                            width: 70.w,
                          ),
                        ),
                        subtitle: Align(
                          alignment: Alignment.topCenter,
                          child: WileToneTextWidget(
                            title: imagename[index].toString(),
                            fontSize: 12.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.black,
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                  ///Crousal Slider
                  CarouselSlider.builder(

                    itemCount: 4,
                    itemBuilder: (context, index, realIndex){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
                        child: WileToneImageWidget(
                          image: AppIconAssets.listviewimages[index].toString(),
                          imageType: ImageType.png,
                        ),
                      );
                    },

                    options: CarouselOptions(

                        height: 184.h,
                        autoPlay: true,
                        aspectRatio: 0.7,
                        onPageChanged: (index, reason){
                          log("Index :- $index");
                          log("Reason :- $reason");
                        },

                        viewportFraction: 0.7,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.slowMiddle,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal),
                  ),

                  SizedBox(
                    height: 40.h,
                  ),

                  ///checkout rewards
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Container(
                      height: 52.h,
                      width: Get.width.w,
                      decoration: BoxDecoration(
                          color: ColorUtils.black,
                          borderRadius: BorderRadius.circular(10.sp)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          const WileToneImageWidget(
                            image: AppIconAssets.reward,
                            imageType: ImageType.png,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          WileToneTextWidget(
                            title: VariablesUtils.check,
                            fontSize: 12.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.white,
                          ),
                          SizedBox(
                            width: 90.w,
                          ),
                          const WileToneImageWidget(
                            image: AppIconAssets.frontarrow,
                            imageType: ImageType.png,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  ///Filter data
                  Row(
                    children : [

                      SizedBox(
                        width: 22.w,
                      ),

                      ///short data
                      InkWell(
                        onTap: (){
                         _showSortData(context);
                        },
                        child: Container(
                          height: 30.h,
                          width: 69.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: ColorUtils.grey,
                              // Set the desired border color
                              width: 1.0, // Set the desired border width
                            ),
                            // color: ColorUtils.red
                          ),
                          child:  Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              const WileToneImageWidget(
                                image: AppIconAssets.sort,
                                imageType: ImageType.png,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              WileToneTextWidget(
                                title: VariablesUtils.sorttext,
                                fontSize: 12.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              const WileToneImageWidget(
                                image: AppIconAssets.arrow,
                                imageType: ImageType.png,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),

                      ///nearest
                      Container(
                        height: 30.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: ColorUtils.grey,
                            // Set the desired border color
                            width: 1.0, // Set the desired border width
                          ),
                          // color: ColorUtils.red
                        ),
                        child:  Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),


                            WileToneTextWidget(
                              title: VariablesUtils.near,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.black,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),

                      ///Great Offers data
                      Container(
                        height: 30.h,
                        width: 86.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: ColorUtils.grey,
                            // Set the desired border color
                            width: 1.0, // Set the desired border width
                          ),
                          // color: ColorUtils.red
                        ),
                        child:  Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),


                            WileToneTextWidget(
                              title: VariablesUtils.greatoffer,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.black,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),

                      ///Timing Data
                      InkWell(
                        onTap: (){
                         _showTimingData(context);
                        },
                        child: Container(
                          height: 30.h,
                          width: 69.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: ColorUtils.grey,
                              // Set the desired border color
                              width: 1.0, // Set the desired border width
                            ),
                            // color: ColorUtils.red
                          ),

                          child:  Row(
                            children: [

                              SizedBox(
                                width: 5.w,
                              ),


                              WileToneTextWidget(
                                title: VariablesUtils.Timing,
                                fontSize: 12.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black,
                              ),

                              SizedBox(
                                width: 5.w,
                              ),

                              const WileToneImageWidget(
                                image: AppIconAssets.arrow,
                                imageType: ImageType.png,
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  ///Restaurant detail
                  ListView.builder(
                    physics : const NeverScrollableScrollPhysics(),
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 0.w, vertical: 0.h),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index){
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding : EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
                              child: WileToneImageWidget(
                                image: AppIconAssets.zomatoimage[index]
                                    .toString(),
                                imageType: ImageType.png,
                              ),
                            ),

                            SizedBox(
                              width: 15.w,
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 25.h),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children : [

                                  Align(
                                    alignment: Alignment.center,
                                    child: WileToneTextWidget(
                                      title: VariablesUtils.hotelname[index]
                                          .toString(),
                                      fontSize: 20.sp,
                                      fontFamily: AssetsUtils.inter,
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                  WileToneTextWidget(
                                    title: VariablesUtils.foodname[index]
                                        .toString(),
                                    fontSize: 14.sp,
                                    fontFamily: AssetsUtils.inter,
                                    fontWeight: FontWeight.w400,
                                    color: ColorUtils.grey8D,
                                  ),
                                  Row(
                                    children: [
                                      WileToneTextWidget(
                                        title: VariablesUtils
                                            .discountpercentage[index]
                                            .toString(),
                                        fontSize: 24.sp,
                                        fontFamily: AssetsUtils.metrophobic,
                                        fontWeight: FontWeight.w700,
                                        color: ColorUtils.lightgreen,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.h,top: 10.h),
                                        child: WileToneTextWidget(
                                          title: VariablesUtils
                                              .off[index]
                                              .toString(),
                                          fontSize: 15.sp,
                                          fontFamily: AssetsUtils.metrophobic,
                                          fontWeight: FontWeight.w600,
                                          color: ColorUtils.lightgreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width : MediaQuery.of(context).size.width / 5.5,
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: WileToneImageWidget(
                                image: AppIconAssets.dotimage[index]
                                    .toString(),
                                imageType: ImageType.png,
                              ),
                            ),

                          ]);
                    },
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  void _showSortData(BuildContext context){
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 16.h,),
                      WileToneTextWidget(
                        title: VariablesUtils.sorttext,
                        fontSize: 18.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black,
                      ),
                      SizedBox(height: 14.h,),
                      Row(
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.relevance,
                            fontSize: 14.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w500,
                            // color: ColorUtils.black,
                          ),
                          Spacer(),
                          Icon(Icons.radio_button_checked,color: ColorUtils.green,size: 25.h,),
                        ],
                      ),
                     SizedBox(height: 12.h,),
                     Row(
                       children: [
                         WileToneTextWidget(
                           title: VariablesUtils.lowToHigh,
                           fontSize: 14.sp,
                           fontFamily: AssetsUtils.poppins,
                           fontWeight: FontWeight.w500,
                           // color: ColorUtils.black,
                         ),
                         Spacer(),
                         Icon(Icons.radio_button_checked,color: ColorUtils.green,size: 25.h,),
                       ],
                     ),
                      SizedBox(height: 12.h,),

                      Row(
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.highToLow,
                            fontSize: 14.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w500,
                            // color: ColorUtils.black,
                          ),
                          Spacer(),
                          Icon(Icons.radio_button_checked,color: ColorUtils.green,size: 25.h,),

                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          WileToneCustomButton(
                            buttonHeight:Get.height*0.07,
                            buttonWidth: Get.width/2.2,
                            buttonColor: ColorUtils.white,
                            onPressed: () {},
                            buttonName: VariablesUtils.clearAll,
                            fontColor: ColorUtils.green,
                          ),

                          WileToneCustomButton(
                            buttonHeight:Get.height*0.07,
                            buttonWidth: Get.width/2.2,
                            buttonColor: ColorUtils.green,
                            onPressed: () {},
                            buttonName: VariablesUtils.ApplyBtn,
                          ),

                        ],
                      ),
                      SizedBox(height: 15.h,),

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

  void _showTimingData(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
            
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
            
                        SizedBox(height: 16.h,),
                        WileToneTextWidget(
                          title: VariablesUtils.timing,
                          fontSize: 18.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                        SizedBox(height: 15.h,),
                        Row(
                          children: [
                            WileToneTextWidget(
                              title: VariablesUtils.all,
                              fontSize: 18.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black,
                            ),
                            Spacer(),
                            Padding(
                              padding:EdgeInsets.only(right: 16.h),
                              child: Icon(Icons.radio_button_checked,color: ColorUtils.green,size: 30.h,),
                            ),
            
                          ],
                        ),
            
                        ListView.builder(
                            physics : const NeverScrollableScrollPhysics(),
                           padding: EdgeInsets.only(bottom: 15.h),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,

                            itemCount: VariablesUtils.restaurantTime.length,
                            itemBuilder: (context, index){
                              return Row(
                                children: [
                                  WileToneTextWidget(title : VariablesUtils.restaurantTime[index]),
                                  Spacer(),
                                  Radio(
                                      activeColor: ColorUtils.green,
                                      toggleable: true,
                                      value: VariablesUtils.restaurantTime.length, groupValue: RestaurantTime, onChanged: (value){
                                        setState(() {
                                          RestaurantTime = value.toString();
                                        });
                                  })
                                ],
                              );

                            }),
                        // SizedBox(height: 10.h,),
            
                        ///Buttons
                        Row(
                          children: [
                            WileToneCustomButton(
                              buttonHeight:Get.height*0.06,
                              buttonWidth: Get.width/2.2,
                              buttonColor: ColorUtils.white,
                              onPressed: () {},
                              buttonName: VariablesUtils.clearAll,
                              fontColor: ColorUtils.green,
                            ),
            
                            WileToneCustomButton(
                              buttonHeight:Get.height*0.06,
                              buttonWidth: Get.width/2.2,
                              buttonColor: ColorUtils.green,
                              onPressed: () {},
                              buttonName: VariablesUtils.ApplyBtn,
                            ),
            
                          ],
                        ),
                        SizedBox(height: 10.h,)
            
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
