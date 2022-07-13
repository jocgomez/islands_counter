import 'package:flutter/material.dart';
import 'package:islands_counter/pages/home_view_model.dart';
import 'package:islands_counter/resources/asset_manager.dart';
import 'package:islands_counter/resources/color_manager.dart';
import 'package:provider/provider.dart';

part './section/island_generate.dart';

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
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.water)),
                  Tab(icon: Icon(Icons.copy_all)),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  const IslandGenerate(),
                  Column(
                    children: const [
                      Text('data'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
