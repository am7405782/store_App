import 'package:flutter/material.dart';

Widget CustomTextFromFaild({
  @required TextEditingController? controller,
  required String label,
  @required IconData? prefixIcon,
  @required IconData? suffixIcon,
  @required TextInputType? keyboardType,
  @required String? Function(String?)? validator,
  @required bool obscureText = false,
  @required void Function()? onTap,
  @required void Function(String)? onFieldSubmitted,
}) =>
    TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.grey,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,
    );

Widget CustomButton({
  required String text,
}) =>
    InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "HappyMonkey",
          ),
        ),
      ),
    );
