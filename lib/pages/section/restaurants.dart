part of '../home_view.dart';

class Restaurants extends StatelessWidget {
  const Restaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetManager.nasaLogo, height: 80),
                Row(
                  children: const [
                    IconContainer(icon: FontAwesomeIcons.bell),
                    SizedBox(width: 5),
                    IconContainer(icon: Icons.settings_outlined),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites',
                  style: textTheme.headline2!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const IconContainer(icon: Icons.add),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 65,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              itemCount: ConstantManager.categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 15);
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
          )
        ],
      ),
    );
  }
}
