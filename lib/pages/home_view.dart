import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islands_counter/pages/home_view_model.dart';
import 'package:islands_counter/resources/asset_manager.dart';
import 'package:islands_counter/resources/color_manager.dart';
import 'package:islands_counter/resources/constant_manager.dart';
import 'package:islands_counter/resources/font_manager.dart';
import 'package:islands_counter/resources/values_manager.dart';
import 'package:islands_counter/widgets/category_container.dart';
import 'package:islands_counter/widgets/icon_container.dart';
import 'package:islands_counter/widgets/restaurant_container.dart';
import 'package:provider/provider.dart';

part './section/island_generate.dart';
part './section/restaurants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      builder: (BuildContext context, _) {
        return const _HomeViewBody();
      },
    );
  }
}

class _HomeViewBody extends StatefulWidget {
  const _HomeViewBody({Key? key}) : super(key: key);

  @override
  State<_HomeViewBody> createState() => __HomeViewBodyState();
}

class __HomeViewBodyState extends State<_HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorManager.primary, ColorManager.secondary],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              title: Image.asset(
                AssetManager.astroLogo,
                height: 40,
              ),
              bottom: TabBar(
                onTap: viewModel.changeTab,
                tabs: const [
                  Tab(icon: Icon(Icons.water)),
                  Tab(icon: Icon(Icons.copy_all)),
                ],
              ),
            ),
            const SliverFillRemaining(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  IslandGenerate(),
                  Restaurants(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: viewModel.status.currentTab == 1
            ? BottomNavigationBar(
                iconSize: 30,
                landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                type: BottomNavigationBarType.shifting,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  viewModel.changeTab(index, isNavTab: true);
                },
                currentIndex: viewModel.status.currentNavTab,
                items: [
                  _bottomNavItem(
                    icon: Icons.home_outlined,
                    label: 'Home',
                  ),
                  _bottomNavItem(
                    icon: Icons.calendar_month_outlined,
                    label: 'Calendar',
                  ),
                  _bottomNavItem(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                  _bottomNavItem(
                    icon: Icons.favorite_border,
                    label: 'Favorite',
                  ),
                ],
              )
            : null,
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      activeIcon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          FittedBox(fit: BoxFit.scaleDown, child: Text(label)),
        ],
      ),
      label: '',
    );
  }
}
