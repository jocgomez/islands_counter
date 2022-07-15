part of '../home_view.dart';

class Restaurants extends StatelessWidget {
  const Restaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    return Container(
      color: ColorManager.greyBg,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p15,
              top: AppPadding.p15,
              right: AppPadding.p15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetManager.nasaLogo, height: AppSize.s80),
                Row(
                  children: const [
                    IconContainer(icon: FontAwesomeIcons.bell),
                    SizedBox(width: AppSize.s4),
                    IconContainer(icon: Icons.settings_outlined),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites',
                  style: textTheme.headline2!.copyWith(
                    fontSize: FontSizeManager.s30,
                    fontWeight: FontWeightManager.superBold,
                  ),
                ),
                const IconContainer(icon: Icons.add),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s15),
          SizedBox(
            height: AppSize.s65,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p10,
                horizontal: AppPadding.p15,
              ),
              itemCount: ConstantManager.categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: AppSize.s15);
              },
              itemBuilder: (context, index) {
                return CategoryContainer(
                  category: ConstantManager.categories.elementAt(index),
                  isSelected: index == viewModel.status.currentCategory,
                  onTap: () {
                    viewModel.changeCurrentCategory(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: AppPadding.p15,
                right: AppPadding.p20,
                left: AppPadding.p15,
              ),
              margin: const EdgeInsets.only(top: AppMargin.m20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppBorderRadius.b30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Happy hours',
                        style: textTheme.headline2!.copyWith(
                          fontSize: FontSizeManager.s20,
                          fontWeight: FontWeightManager.bold,
                        ),
                      ),
                      const IconContainer(icon: Icons.delete_outline),
                    ],
                  ),
                  const SizedBox(height: AppSize.s25),
                  Expanded(
                    child: ListView.separated(
                      itemCount: viewModel.status.isLoading
                          ? 3
                          : viewModel.status.restaurants.length,
                      padding: const EdgeInsets.only(
                        top: AppSize.s12,
                        bottom: AppPadding.p25,
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: AppSize.s25);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        if (viewModel.status.isLoading) {
                          return Container(
                            padding: const EdgeInsets.only(
                              top: AppPadding.p2,
                              right: AppPadding.p15,
                              bottom: AppPadding.p40,
                              left: AppPadding.p15,
                            ),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.b20),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.greyShadow,
                                  offset: const Offset(0, 2),
                                  spreadRadius: 0.5,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              enabled: viewModel.status.isLoading,
                              child: const LoadingRestaurantContainer(),
                            ),
                          );
                        }
                        return RestaurantContainer(
                          urlImage:
                              viewModel.status.restaurants[index].getImageUrl,
                          title: viewModel.status.restaurants[index].title,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
