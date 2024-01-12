import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/validations_utils.dart';
import '../../utils/typedef_utils.dart';

class WileToneTextFormField extends StatelessWidget {
  const WileToneTextFormField(
      {Key? key,
      this.onChange,
      this.titleText,
      this.isValidate,
      this.containerHeight,
      this.textInputType,
      this.withOutIcon,
      this.hintStyle,
      this.regularExpression = '',
      this.inputLength,
      this.readOnly = false,
      this.hintText,
      this.validationMessage,
      this.maxLine,
      this.sIcon,
      this.borderRadius,
      this.containerBgColor,
      this.obscureValue = false,
      this.pIcon,
      this.textCapitalization,
      this.focusNode,
      this.onTap,
      this.isAddress,
      this.useRegularExpression,
      this.validationtype,
      this.textInputAction,
      this.fillcolor,
      this.enabled,
      required this.borderSide,
      this.height,
      this.filled,
      required this.controller})
      : super(key: key);

  final String? titleText;
  final double? height;
  final BorderSide borderSide;
  final bool? isValidate;
  final TextEditingController controller;
  final bool? readOnly;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final String? regularExpression;
  final int? inputLength;
  final String? hintText;
  final String? validationMessage;
  final int? maxLine;
  final bool? filled;
  final Widget? sIcon;
  final Widget? pIcon;
  final bool? obscureValue;
  final bool? withOutIcon;
  final double? borderRadius;
  final double? containerHeight;
  final Color? containerBgColor;
  final TextStyle? hintStyle;
  final OnTap? onTap;
  final Color? fillcolor;
  final bool? isAddress;
  final bool? enabled;
  final bool? useRegularExpression;
  final ValidationType? validationtype;
  final OnChangeString? onChange;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: ColorUtils.black,
          fontSize: 12.sp,
          fontWeight: FontWeightClass.medium,
        ),
        onTap: () {
          if (isAddress == true) {
            onTap!();
          }
        },
        cursorColor: Colors.grey,
        obscureText: obscureValue!,
        maxLines: maxLine ?? 1,
        textInputAction: textInputAction ?? TextInputAction.done,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: regularExpression!.isEmpty
            ? [
                LengthLimitingTextInputFormatter(inputLength),
                // FilteringTextInputFormatter.deny(RegExp(r'\s')),
                NoLeadingSpaceFormatter(),
              ]
            : [
                LengthLimitingTextInputFormatter(inputLength),
                NoLeadingSpaceFormatter(),
                FilteringTextInputFormatter.allow(RegExp(regularExpression ??
                    RegularExpression.alphabetDigitsDashPattern))
              ],
        keyboardType: textInputType,
        maxLength: inputLength,
        validator: (value) {
          return isValidate == false
              ? null
              : value!.isEmpty
                  ? validationMessage
                  : validationtype == ValidationType.email
                      ? ValidationMethod.validateUserName(value)
                      : validationtype == ValidationType.pNumber
                          ? ValidationMethod.validatePhoneNo(value)
                          : validationtype == ValidationType.amount
                              ? ValidationMethod.validateAmount(value)
                              : null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: filled,
          fillColor: fillcolor,
          prefixIcon: pIcon,
          suffixIcon: sIcon,
          // enabled : false,
          enabledBorder: OutlineInputBorder(
              borderSide: borderSide,
              borderRadius: BorderRadius.circular(borderRadius ?? 8)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorUtils.lightGreyD3),
              borderRadius: BorderRadius.circular(borderRadius ?? 8)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorUtils.lightGreyD3),
              borderRadius: BorderRadius.circular(borderRadius ?? 8)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorUtils.red),
              borderRadius: BorderRadius.circular(borderRadius ?? 8)),
          hintStyle: hintStyle ??
              TextStyle(fontSize: 10.sp, color: ColorUtils.lightGreyA6),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        ),
      ),
    );
  }
}

///Not Allowed Leading Text
class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimmedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimmedText,
        selection: TextSelection(
          baseOffset: trimmedText.length,
          extentOffset: trimmedText.length,
        ),
      );
    }

    return newValue;
  }
}
