import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wilatone_restaurant/common/common_widget/loading_indicator.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/send_otp_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/verify_otp_res_model.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';
import 'package:wilatone_restaurant/view/auth/create_profile_screen.dart';
import 'package:wilatone_restaurant/view/auth/enable_location_screen.dart';
import 'package:wilatone_restaurant/view/auth/search_area.dart';
import 'package:wilatone_restaurant/view/dashboard/bottombar_screen.dart';
import '../../utils/utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/login_screen.dart';
import 'package:wilatone_restaurant/viewModel/auth_view_model.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String dialcode;

  const OtpVerificationScreen({
    Key? key,
    required this.phoneNumber,
    required this.dialcode,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpEditController = TextEditingController();
  LoginScreen loginScreen = const LoginScreen();
  AuthViewModel authViewModel = Get.find<AuthViewModel>();
  VerifyOtpResModel verifyOtpRes = VerifyOtpResModel();

  final interval = const Duration(seconds: 1);
  int currentSeconds = 60, countDownTime = 150, timerMaxSeconds = 150;
  String? timerText = "150";
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(interval, (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  startTimeout([int? milliseconds]) {
    Timer.periodic(interval, (timer) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          currentSeconds = currentSeconds - 1;
          if (currentSeconds == 0) timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    _startTimer();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  String codeValue = "";

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const WileToneAppBar(title: VariablesUtils.oTPVerification),
                SizedBox(
                  height: 20.h,
                ),

                WileToneTextWidget(
                  title: VariablesUtils.weHaveSentVerificationCodeTo,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.grey5B,
                ),

                SizedBox(
                  height: 2.5.h,
                ),

                /// OTP MOBILE NUMBER

                WileToneTextWidget(
                  title: "+${widget.dialcode} ${widget.phoneNumber}",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorUtils.black,
                ),

                SizedBox(
                  height: 30.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.w),
                  child: Pinput(
                    length: 6,
                    autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Otp';
                      } else if (value.length != 6) {
                        return 'OTP must be 6 digits';
                      }
                      return null;
                    },
                    controller: otpEditController,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    autofillHints: const [AutofillHints.oneTimeCode],
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    textInputAction: TextInputAction.done,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    defaultPinTheme: PinTheme(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      width: Get.width / 6,
                      height: Get.width / 8.9,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    followingPinTheme: PinTheme(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      width: Get.width / 6,
                      height: Get.width / 8.9,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.grey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    errorPinTheme: PinTheme(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      width: Get.width / 6,
                      height: Get.width / 8.9,
                      textStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.grey5B, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),

                /// ReSend OTP
                InkWell(
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (formKey.currentState!.validate()) {}

                    Get.dialog(
                      postDataLoadingIndicator(),
                    );

                    await authViewModel.sendOtp(widget.phoneNumber, false);

                    if (authViewModel.sendOtpApiResponse.status ==
                        Status.COMPLETE) {
                      SendOtpResModel res =
                          authViewModel.sendOtpApiResponse.data;
                      if (kDebugMode) {
                        print('RES CODE ==>${res.code}');
                      }

                      if (res.code == 200) {
                        currentSeconds = 30;
                        startTimeout();
                        print('======${res.message}');
                        Get.back();
                        Utils.snackBar(message: '${res.message}');
                      } else {
                        Get.back();
                        Utils.snackBar(
                            message: res.message ?? VariablesUtils.codesent,
                            bgColor: Colors.red);
                      }
                    }
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: VariablesUtils.didntGetOtp,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AssetsUtils.poppins),
                        ),
                        TextSpan(
                          text: VariablesUtils.resendSMSIn,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.greyAC,
                              fontFamily: AssetsUtils.poppins),
                        ),
                        currentSeconds != 0
                            ? TextSpan(
                                text: formatHHMMSS(currentSeconds),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorUtils.greyAC,
                                    fontFamily: AssetsUtils.poppins),
                              )
                            : const TextSpan(text: ""),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                /// Verify OTP
                InkWell(
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();

                    Get.dialog(
                      postDataLoadingIndicator(),
                    );

                    /// Post data
                    await authViewModel.verifyOtp(
                        widget.phoneNumber, otpEditController.text);

                     log("OTP :- ${otpEditController.text}");
                     if(otpEditController.text.isEmpty){
                       Get.back();
                       Utils.snackBar(message: 'Plz Enter OTP');
                     }

                   else if(authViewModel.verifyOtpApiResponse.status == Status.COMPLETE){

                      VerifyOtpResModel res = authViewModel.verifyOtpApiResponse.data;

                      if(kDebugMode){
                        print('RES CODE ==>${res.code}');
                      }

                      if (res.code == 200){

                        if(kDebugMode) {
                          print('====== message :- ${res.message}');
                        }

                        // Now, you can access the accessToken
                        String? accessToken = res.data?.accessToken;
                        print('AccessToken: $accessToken');

                        await PreferenceManagerUtils.saveAccessToken(accessToken!);

                        String? getaccessToken = PreferenceManagerUtils.getAccessToken();

                        if (getaccessToken != '' && getaccessToken.isNotEmpty){
                          log("Get Token :- $getaccessToken");

                        }

                        else {
                          log(" Access token is not available, handle accordingly");
                        }

                        Get.back();
                        Utils.snackBar(message: '${res.message}');
                        otpEditController.clear();

                        if (authViewModel.verifyOtpApiResponse.status ==
                            Status.COMPLETE) {
                          VerifyOtpResModel response =
                              authViewModel.verifyOtpApiResponse.data;

                          if (response.code == 200) {
                            log("Name :- ${response.data!.name}");

                            if(response.data!.name != null && response.data!.areaName != null){
                              PreferenceManagerUtils.saveLoginData(true);
                              log("saveLoginData :- ${PreferenceManagerUtils.saveLoginData(true)}");
                              Get.to(const BottombarScreen());
                              otpEditController.clear();
                            }

                            else if(response.data!.name == null){

                              Get.to(const CreateProfileScreen());
                              otpEditController.clear();
                            }
                            else{
                              Get.to(const LocationScreen());
                              otpEditController.clear();
                            }
                          }

                          else {
                            log("res.message :- ${res.message}");
                            Get.back();
                            Utils.snackBar(
                                message:
                                    res.message ?? VariablesUtils.verifyotp,
                                bgColor: Colors.red);
                          }
                        }
                      } else {
                        log("res.message :- ${res.message}");
                        Get.back();
                        Utils.snackBar(
                            message: res.message ?? VariablesUtils.verifyotp,
                            bgColor: Colors.red);
                      }
                    }
                  },
                  child: WileToneTextWidget(
                    title: VariablesUtils.goBackToLoginMethods,
                    color: ColorUtils.greenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
