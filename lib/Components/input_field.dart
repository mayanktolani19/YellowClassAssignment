import 'package:flutter/material.dart';
import 'package:yellow_class/Utility/colors.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(this.hintText, this.icon, this.controller);
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 1.5,
        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: TextField(
              cursorColor: AppColor.accentColor,
              textCapitalization: TextCapitalization.words,
              controller: controller,
              keyboardType: hintText == 'Phone'
                  ? TextInputType.numberWithOptions()
                  : TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 0.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 0.0,
                    ),
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  labelText: hintText)),
        ),
      ),
    );
  }
}
