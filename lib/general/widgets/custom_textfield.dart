import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLines;
  final double? height;
  final bool readOnly;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final BorderSide borderSide;
  final Color? fillColor;
  final Color? cursorColor;
  final List<BoxShadow>? boxShadow;
  final List<TextInputFormatter>? inputFormatters;
  final double? contentPadding;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? autofocus;
  final double? borderRadius;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final Color? focusedBorderColor;
  final TextAlign? textAlign;
  final String? initialValue;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines,
    this.height,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.hintStyle = const TextStyle(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.onChanged,
    this.borderSide = BorderSide.none,
    this.fillColor,
    this.inputFormatters,
    this.boxShadow,
    this.contentPadding,
    this.labelText,
    this.labelStyle,
    this.autofocus,
    this.borderRadius,
    this.autovalidateMode,
    this.cursorColor,
    this.textInputAction,
    this.focusedBorderColor,
    this.textAlign,
    this.initialValue,
    this.focusNode,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadow,
      ),
      child: TextFormField(
        scrollPadding: EdgeInsets.only(bottom: 100),
        focusNode: focusNode,
        initialValue: initialValue,
        textAlign: textAlign ?? TextAlign.start,
        textInputAction: textInputAction,
        autofocus: autofocus ?? false,
        cursorColor: cursorColor ?? Colors.black,
        onTap: onTap,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          contentPadding: EdgeInsets.only(
            bottom: contentPadding ?? 10,
            left: contentPadding ?? 15,
            right: contentPadding ?? 10,
            top: contentPadding ?? 10,
          ),
          counterStyle: const TextStyle(height: double.minPositive),
          counterText: "",
          filled: true,
          fillColor: fillColor ?? Colors.transparent,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: focusedBorderColor ?? AppColors.black,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.black, width: .0),
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
        ),
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        readOnly: readOnly,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
