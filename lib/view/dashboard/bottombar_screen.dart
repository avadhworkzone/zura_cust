import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
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
import 'package:wilatone_restaurant/view/dashboard/all_brands.dart';
import 'package:wilatone_restaurant/view/dashboard/reward_screen.dart';

class BottombarScreen extends StatefulWidget{
  const BottombarScreen({Key? key}) : super(key: key);

  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen>{

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static Rx<TextEditingController> searchstores = TextEditingController().obs;

  final List<String> _imageAssets = [
    AppIconAssets.homeicon,
    AppIconAssets.rewardicon,
    AppIconAssets.searchoicon,
  ];

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
  static int currentIndex = 0;

  Color _getIconColor(int index) {
    return index == _selectedIndex ? ColorUtils.black : ColorUtils.lightGreyA6;
  }

  static final List<Widget> _widgetOptions = <Widget>[

    /// Home Screen
    Padding(padding : EdgeInsets.symmetric(horizontal: 15.w,),
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

                /// sort data
                Row(
                  children : [
            
                    SizedBox(
                      width: 22.w,
                    ),
            
                    Container(
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
                    SizedBox(
                      width: 10.w,
                    ),
            
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
            
                    Container(
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
                    )
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

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
                            padding : EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
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
                                WileToneTextWidget(
                                  title: VariablesUtils
                                      .discountpercentage[index]
                                      .toString(),
                                  fontSize: 24.sp,
                                  fontFamily: AssetsUtils.metrophobic,
                                  fontWeight: FontWeight.w700,
                                  color: ColorUtils.lightgreen,
                                )
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

    /// Reward screen
    RewardScreen(),

    const Text(
      'Index 2: Explore',
      style: optionStyle,
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      if (kDebugMode){
        print("Index :- $index");
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){

    return SafeArea(
      child: Scaffold(

        body: _widgetOptions.elementAt(_selectedIndex),

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: WileToneImageWidget(
                color: _getIconColor(0),
                image: _imageAssets[0],
                imageType: ImageType.png,
                height: 27.h,
                width: 24.w,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: WileToneImageWidget(
                color: _getIconColor(1),
                image: _imageAssets[1],
                imageType: ImageType.png,
                height: 27.h,
                width: 24.w,
              ),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              icon: WileToneImageWidget(
                color: _getIconColor(2),
                image: _imageAssets[2],
                imageType: ImageType.png,
                height: 27.h,
                width: 24.w,
              ),
              label: 'Explore',
            ),
          ],

          currentIndex : _selectedIndex,
          selectedItemColor : ColorUtils.black,
          selectedFontSize : 12.sp,
          unselectedItemColor : ColorUtils.lightGreyA6,
          unselectedFontSize : 12.sp,
          selectedLabelStyle : TextStyle(color: ColorUtils.black, fontSize: 12.sp),
          // unselectedLabelStyle : TextStyle(color: ColorUtils.black,fontSize: 12.sp),
          onTap : _onItemTapped,
        ),
      ),
    );
  }
}
