import 'package:flutter/material.dart';
import 'package:islands_counter/resources/asset_manager.dart';
import 'package:islands_counter/resources/color_manager.dart';
import 'package:islands_counter/resources/font_manager.dart';
import 'package:islands_counter/resources/values_manager.dart';
import 'package:islands_counter/widgets/icon_container.dart';

class RestaurantContainer extends StatelessWidget {
  final String urlImage;
  final String title;
  const RestaurantContainer({
    Key? key,
    required this.urlImage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(
        top: AppPadding.p2,
        right: AppPadding.p15,
        bottom: AppPadding.p40,
        left: AppPadding.p15,
      ),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(AppBorderRadius.b20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.greyShadow,
            offset: const Offset(0, 2),
            spreadRadius: 0.5,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_horiz,
              color: ColorManager.grey,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s100,
                width: AppSize.s150,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.b15),
                      ),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: AssetManager.loading,
                        image: urlImage,
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      child: IconContainer(
                        icon: Icons.favorite,
                        iconColor: ColorManager.orangeDark,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: AppSize.s20),
              Flexible(
                child: Text(
                  title,
                  style: textTheme.headline2!.copyWith(
                    height: 1.1,
                    fontSize: FontSizeManager.s20,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
