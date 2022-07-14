import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String category;
  const CategoryContainer({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset: const Offset(0, 2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Text(
          category,
          style: textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      onTap: () {},
    );
  }
}
