import 'package:flutter/material.dart';
import 'package:islands_counter/resources/color_manager.dart';
import 'package:islands_counter/resources/values_manager.dart';

class LoadingRestaurantContainer extends StatelessWidget {
  const LoadingRestaurantContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.more_horiz,
            color: ColorManager.white,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: AppSize.s100,
              width: AppSize.s150,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppBorderRadius.b15,
                  ),
                  color: ColorManager.white,
                ),
              ),
            ),
            const SizedBox(width: AppSize.s20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: ColorManager.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: ColorManager.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 40.0,
                    height: 8.0,
                    color: ColorManager.white,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
