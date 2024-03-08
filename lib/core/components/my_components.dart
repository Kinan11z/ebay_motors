import 'package:ebay_motors/core/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

Widget myFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  String? hintText,
  TextStyle? hintStyle,
  required String label,
  TextStyle? labelStyle,
  Widget? prefix,
  TextStyle? style,
  TextStyle? prefixStyle,
  String? prefixText,
  TextAlign textAlign = TextAlign.start,
  Widget? suffix,
  bool readOnly = false,
  void Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      readOnly: readOnly,
      style: style,
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixStyle: prefixStyle,
        labelStyle: labelStyle,
        prefixText: prefixText,
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: suffix,
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

//***************************************************** */

Widget myButton({
  double? width,
  double? height,
  Color backgroundColor = Colors.blue,
  bool isUpperCase = true,
  double radius = 12,
  double fontSize = 20,
  required void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: MyColors().grey, fontSize: fontSize),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
    );
