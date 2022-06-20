import 'package:flutter/material.dart';
import 'package:news_app/cubit/mode_cubit/mode_cubit.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final Function validate;
  final VoidCallback? suffixPressed;
  final VoidCallback? onTap;
  final Function? onChange;

  ReusableTextField(
      {required this.controller,
      this.isPassword = false,
      required this.prefixIcon,
      this.suffixIcon,
      required this.textLabel,
      required this.validate,
      this.suffixPressed,
      this.onTap,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: textLabel,
        labelStyle: ModeCubit.get(context).isDark
            ? const TextStyle(
                color: Colors.white,
              )
            : const TextStyle(
                color: Colors.black,
              ),
        prefixIcon: Icon(
          prefixIcon,
          color: ModeCubit.get(context).isDark ? Colors.white : Colors.black,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ModeCubit.get(context).isDark ? Colors.white : Colors.black,
          ),
        ),
        disabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: ModeCubit.get(context).isDark ? Colors.white : Colors.black,
      ),
    ),
      ),
      obscureText: isPassword,
      onTap: onTap,
      validator: (val) => validate(val),
      onChanged: (val) => onChange!(val),
    );
  }
}
