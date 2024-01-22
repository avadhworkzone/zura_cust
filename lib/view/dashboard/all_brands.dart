import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/bottomSheet/sort_bottomsheet.dart';
import 'package:wilatone_restaurant/view/bottomSheet/timing_bottomsheet.dart';
import 'package:wilatone_restaurant/view/popUp/pop_up.dart';
import '../restaurantDetailScreen/restaurant_detail.dart';


class AllBrandsScreen  extends  StatefulWidget {
  const AllBrandsScreen({Key? key}) : super(key: key);

  @override
  State<AllBrandsScreen> createState() => _AllBrandsScreenState();
}


class _AllBrandsScreenState extends State<AllBrandsScreen>{

  Rx<TextEditingController> searchstores1 = TextEditingController().obs;
  Sortbottomsheet sortsheet =  Sortbottomsheet();
  TimingBottomSheet timesheet = TimingBottomSheet();
  // RxBool isvisible = false.obs;
  PopupMenu popup = PopupMenu();


  // final ScrollController _scrollController = ScrollController();

  // @override
  // void initState(){
  //   super.initState();
  //
  //   if (_scrollController.initialScrollOffset < 250) {
  //     isvisible.value = true;
  //   } else {
  //     isvisible.value = false;
  //   }
  //
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels < 250) {
  //       isvisible.value = true;
  //     } else {
  //       isvisible.value = false;
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context){

    log("Total Height :- ${Get.height}");

    return Scaffold(
        backgroundColor: ColorUtils.greengrey,
        body: SafeArea(
          child: ListView(
            children: [

              /// 1st container of all brand data
              Container(
                height: 180.h,
                color: ColorUtils.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),

                      /// Search Store Textfield
                      WileToneTextFormField(

                        controller: searchstores1.value,
                        pIcon: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: WileToneImageWidget(

                            color: ColorUtils.lightGreyA6,
                            image: AppIconAssets.picon,
                            imageType: ImageType.png,
                            height: 12.h,
                            width: 7.41.w,
                          ),
                        ),
                        sIcon: WileToneImageWidget(
                          color: ColorUtils.lightGreyA6,
                          image: AppIconAssets.searchoicon,
                          imageType: ImageType.png,
                          height: 24.h,
                          width: 24.w,
                        ),
                        filled: false,
                        height: 52.h,
                        borderSide:
                            const BorderSide(color: ColorUtils.lightGreyD7),
                        borderRadius: 57.sp,
                        hintText: VariablesUtils.searchstores,
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: ColorUtils.lightGreyA6,
                            fontWeight: FontWeight.w500),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),


                  /// All Brands data
                      SizedBox(
                        height: 78.h,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount : 12,
                          itemBuilder : (context, index){

                            if(index == 0){
                              log("Index0 :- $index");

                              return  Padding(
                                padding : EdgeInsets.only(right: 5.w),
                                child : Column(
                                    mainAxisSize : MainAxisSize.min,
                                    children : [

                                      Container(
                                        height : 45.h,
                                        width : 45.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    AppIconAssets.menu1))),
                                      ),

                                      Expanded(
                                        child: WileToneTextWidget(
                                          title: 'All Brands',
                                          fontSize: 12.sp,
                                          fontFamily: AssetsUtils.inter,
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ]),
                              );
                            }

                            log("Index1 :- $index");

                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 9.w),
                              child: Column(

                                  children: [

                                    Container(
                                      height: 45.h,
                                      width: 45.h,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(

                                        AppIconAssets.breadimages[index - 1]
                                            .toString(),
                                      ))),
                                    ),

                                    Expanded(
                                      child: WileToneTextWidget(
                                        title: VariablesUtils
                                            .listname[index - 1]
                                            .toString(),
                                        fontSize: 12.sp,
                                        fontFamily: AssetsUtils.inter,
                                        fontWeight: FontWeight.w500,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                  ]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              /// Below container of hotel data
              // if(_scrollController.position.pixels < 250)

              Container(
                height: MediaQuery.of(context).size.height / 1.3931,
                decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp),
                    )),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children : [

                    SizedBox(
                      height: 20.h,
                    ),

                    /// Filter data
                    Row(
                      children: [

                        SizedBox(
                          width: 22.w,
                        ),

                        InkWell(
                          onTap : (){
                            sortsheet.showSortData(context);
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

                            child: Row(
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

                        Container(
                          height : 30.h,
                          width : 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: ColorUtils.grey,
                              // Set the desired border color
                              width: 1.0, // Set the desired border width
                            ),
                            // color: ColorUtils.red
                          ),

                          child: Row(
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

                          child : Row(
                            children : [

                              SizedBox(
                                width : 5.w,
                              ),

                              WileToneTextWidget(
                                title : VariablesUtils.greatoffer,
                                fontSize : 12.sp,
                                fontFamily : AssetsUtils.poppins,
                                fontWeight : FontWeight.w500,
                                color: ColorUtils.black,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),

                        InkWell(
                          onTap: (){
                            timesheet.showTimingData(context);
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

                            child: Row(
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
                      height: 10.h,
                    ),


                    /// Hotel data

                    Expanded(
                      child : ListView.builder(
                        padding : EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
                        scrollDirection : Axis.vertical,
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap : true,
                        itemCount : 5,
                        itemBuilder : (context, index){
                          return InkWell(
                            onTap: (){
                              Get.to(const RestaurantDetailScreen());
                            },
                            child: Row(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children : [

                                  Padding(
                                    padding : EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 5.w),
                                    child : SizedBox(
                                      width : Get.width <= 290 ? 60 : 90,

                                      child: WileToneImageWidget(
                                        image : AppIconAssets.zomatoimage[index].toString(),
                                        imageType : ImageType.png,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 15.w,
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: Get.width <= 280 ? 15.h :  25.h ),
                                    child : Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment : CrossAxisAlignment.start,
                                      children: [

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
                                              fontFamily: AssetsUtils.inter,
                                              fontWeight: FontWeight.w700,
                                              color: ColorUtils.lightgreen,
                                            ),

                                            SizedBox(
                                              width: 10.sp,
                                            ),

                                            WileToneTextWidget(
                                              title: VariablesUtils.off[index].toString(),
                                              fontSize: 15.sp,
                                              fontFamily: AssetsUtils.metrophobic,
                                              fontWeight: FontWeight.w700,
                                              color: ColorUtils.lightgreen,
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 7.5,
                                  ),

                                  popup.popup(context)

                                ]),
                          );
                        },
                      ),
                    )

                  ],
                ),
              ),

            ],
          ),
        ));
  }
}