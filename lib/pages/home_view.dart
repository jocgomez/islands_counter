import 'package:flutter/material.dart';
import 'package:islands_counter/resources/asset_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _HomeViewBody();
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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff8e24a1), Color(0xffd61557)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            title: Image.asset(
              AssetManager.astroLogo,
              height: 40,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
