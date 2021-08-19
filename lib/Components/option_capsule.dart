import 'package:flutter/material.dart';
import 'package:yellow_class/Utility/colors.dart';

class OptionCapsule extends StatelessWidget {
  String title;
  IconData icon;
  bool isSelected;
  Function onPressed;

  OptionCapsule(
      {required this.icon,
      required this.isSelected,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: (isSelected) ? AppColor.accentColor : AppColor.unselectedColor,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: (isSelected)
                  ? AppColor.textColorLgLight
                  : AppColor.unselectedTextColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: (isSelected)
                    ? AppColor.textColorLgLight
                    : AppColor.unselectedTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
