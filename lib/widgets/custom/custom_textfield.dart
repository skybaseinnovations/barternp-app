import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final String? preIconPath;
  final String? suffixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final double borderRadius;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final Icon? prefixIcon;
  final VoidCallback? onEditing;
  // final EdgeInsets scrollPadding;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    Key? key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
    this.suffixIconPath,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
    this.borderRadius = 8,
    this.prefixIcon,
    this.onEditing,
    this.hintStyle,
    // this.scrollPadding = const EdgeInsets.all(20.0),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.cursorHeight = 13,
    this.onSuffixTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // scrollPadding: scrollPadding,
      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus!,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmitted,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: (readOnly == null) ? false : readOnly!,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: 1,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onEditingComplete: onEditing,
      // cursorColor: AppColors.backGroundColor,
      cursorColor: AppColor.secondaryTextColor,
      cursorHeight: cursorHeight,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      decoration: InputDecoration(
        // isDense: true,
        contentPadding: contentPadding,

        label: labelText != null
            ? Text(
                labelText ?? "",
              )
            : null,
        fillColor: fillColor ?? Colors.white,
        filled: true,

        prefixIcon: prefixIcon,
        suffixIcon: (suffixIconPath != null)
            ? GestureDetector(
                onTap: onSuffixTap,
                child: SvgPicture.asset(
                  suffixIconPath!,
                  fit: BoxFit.scaleDown,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide.none),
        errorStyle: const TextStyle(fontSize: 12),
        hintText: hint,
        hintStyle: hintStyle ?? const TextStyle(color: AppColor.tertiaryTextColor),
        // hintStyle: CustomTextStyles.f16W400(color: AppColors.hintTextColor),
      ),
      // style: CustomTextStyles.f16W400(
      //     color: (readOnly ?? false) ? AppColors.hintTextColor : AppColors.backGroundColor),
    );
  }
}
