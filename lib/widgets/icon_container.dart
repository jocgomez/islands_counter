import 'package:flutter/material.dart';
import 'package:islands_counter/resources/color_manager.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Icon(
        icon,
        color: ColorManager.blackText,
      ),
    );
  }
}
