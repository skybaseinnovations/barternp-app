import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class CustomOutlineBorderTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String? hint;
  final String? preIconPath;
  final String? suffixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool showError;
  final bool? autofocus;
  final String? labelText;
  final double borderRadius;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;

  const CustomOutlineBorderTextField({
    super.key,
    this.fillColor,
    this.hint,
    this.preIconPath,
    this.suffixIconPath,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    required this.textInputType,
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
    this.borderRadius = 30,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      cursorColor: AppColor.tertiaryTextColor,
      textAlignVertical: TextAlignVertical.bottom,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.primaryTextColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
          prefixIcon: (preIconPath != null)
              ? Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: SvgPicture.asset(
                    alignment: Alignment.bottomRight,
                    preIconPath!,
                    fit: BoxFit.scaleDown,
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
          suffixIcon: (suffixIconPath != null)
              ? Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: SvgPicture.asset(
                    alignment: Alignment.bottomRight,
                    suffixIconPath!,
                    fit: BoxFit.scaleDown,
                  ),
                )
              : null,
          fillColor: fillColor ?? Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          isDense: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.tertiaryTextColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.tertiaryTextColor),
          ),
          hintText: hint,
          hintStyle: hintStyle,
          errorStyle: showError
              ? null
              : const TextStyle(
                  fontSize: 0,
                )),
    );
  }
}
