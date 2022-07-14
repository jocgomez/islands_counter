import 'package:flutter/material.dart';
import 'package:islands_counter/resources/color_manager.dart';

class CategoryContainer extends StatelessWidget {
  final String category;
  final bool isSelected;
  final Function()? onTap;

  const CategoryContainer({
    Key? key,
    required this.category,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? Colors.orange[700] : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset: const Offset(0, 3),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
        ),
        child: Text(
          category,
          style: textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : ColorManager.blackText,
          ),
        ),
      ),
    );
  }
}
