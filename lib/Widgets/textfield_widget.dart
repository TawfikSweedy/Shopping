import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';


// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final bool? readOnly;
  final String? hint;
  final Color? backGroundColor, focusedBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine,minLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? enable, isDense, decorationUnderLine;
  final Color? borderColor;
  final double? borderRadiusValue, width, height, borderWidth;
  final EdgeInsets? insidePadding;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String)? onchange;
  final Function()? onSuffixTap;
  final int? maxLength;
  final void Function(String?)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;

  const TextFieldWidget({
    Key? key,
    this.isDense,
    this.textAlign,
    this.style,
    this.onchange,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.textInputAction,
    this.insidePadding,
    this.validator,
    this.maxLine,
    this.minLines,
    this.hint,
    this.backGroundColor,
    this.controller,
    this.obscure = false,
    this.enable = true,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.borderColor,
    this.borderRadiusValue,
    this.prefixIcon,
    this.width,
    this.height,
    this.hintStyle,
    this.suffixIcon,
    this.onSuffixTap,
    this.maxLength,
    this.decorationUnderLine = false,
    this.inputFormatters,
    this.focusedBorder,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 343.w,
      child: TextFormField(
        maxLines: maxLine ?? 1,
        minLines:minLines?? 1 ,
        onTapOutside: onTapOutside,
        onFieldSubmitted:onFieldSubmitted ,
        maxLength: maxLength,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign ?? TextAlign.start,
        validator: validator,
        enabled: enable,
        obscureText: obscure ?? false,
        controller: controller,

        decoration: decorationUnderLine == false
            ? InputDecoration(
          errorStyle: const TextStyle(height: 0),
          enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(borderRadiusValue ?? 8.r),
              borderSide: BorderSide(
                  color: borderColor ?? ThemeClass.colorE2E2E2,
                  width: borderWidth ?? 1.w)),
          disabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(borderRadiusValue ?? 8.r),
              borderSide: BorderSide(
                  color: borderColor ?? ThemeClass.colorE2E2E2,
                  width: borderWidth ?? 1.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(borderRadiusValue ?? 8.r),
              borderSide: BorderSide(
                  color: focusedBorder ?? ThemeClass.colorE2E2E2,
                  width: borderWidth ?? 1.w)),
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(borderRadiusValue ?? 8.r),
              borderSide: BorderSide(
                  color: borderColor ?? ThemeClass.colorE2E2E2,
                  width: borderWidth ?? 1.w)),
          isDense: isDense ?? false,
          prefixIconConstraints: BoxConstraints(
              minWidth: prefixIcon == null ? 0 : 35.w, maxHeight: 20.w),
          suffixIconConstraints: BoxConstraints(
              minWidth: suffixIcon == null ? 0 : 35.w, maxHeight: 20.w),
          contentPadding:
          insidePadding ?? EdgeInsets.symmetric(vertical: 23.h),
          fillColor: backGroundColor,
          filled: backGroundColor != null,
          hintText: hint,
          prefixIcon: prefixIcon == null
              ? SizedBox(
            width: 10.w,
          )
              : SizedBox(child: prefixIcon),
          suffixIcon: suffixIcon == null
              ? SizedBox(
            width: 5.w,
          )
              : InkWell(
            onTap: onSuffixTap,
            child: SizedBox(width: 50.w, child: suffixIcon),
          ),
          hintStyle: hintStyle ??
              TextStyle(
                  fontSize: 12.sp,
                  color: ThemeClass.color8898AA,
                  fontWeight: FontWeight.w400),
        )
            : InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeClass.colorD7D7D7,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeClass.colorD7D7D7,
            ),
          ),
          isDense: isDense ?? false,
          prefixIconConstraints: BoxConstraints(
              minWidth: prefixIcon == null ? 0 : 35.w, maxHeight: 20.w),
          suffixIconConstraints: BoxConstraints(
              minWidth: suffixIcon == null ? 0 : 35.w, maxHeight: 20.w),
          contentPadding:
          insidePadding ?? EdgeInsets.symmetric(vertical: 23.h),
          fillColor: backGroundColor,
          filled: backGroundColor != null,
          hintText: hint,
          prefixIcon: prefixIcon == null
              ? SizedBox(
            width: 10.w,
          )
              : SizedBox(child: prefixIcon),
          suffixIcon: suffixIcon == null
              ? SizedBox(
            width: 5.w,
          )
              : InkWell(
            onTap: onSuffixTap,
            child: SizedBox(width: 50.w, child: suffixIcon),
          ),
          hintStyle: hintStyle ??
              TextStyle(
                  fontSize: 12.sp,
                  color: ThemeClass.color8898AA,
                  fontWeight: FontWeight.w400),
        ),
        onChanged: onchange,
        // textCapitalization: TextCapitalization.words,
        keyboardType: textInputType,
        style: style ??
            TextStyle(
                fontSize: 14.sp,
                color: ThemeClass.primaryColor,
                fontWeight: FontWeight.w400),
      ),
    );
  }
}
