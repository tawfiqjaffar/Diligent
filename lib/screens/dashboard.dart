import 'package:Diligent/widgets/dashboard_stats.dart';
import 'package:Diligent/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final searchTextFieldEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).unfocus(),
        print(searchTextFieldEditingController.text)
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            floating: true,
            flexibleSpace: CustomAppBar(
              imgUrl:
                  "https://www.gravatar.com/avatar/867e47ad7bfdfa41da4db0b662b1b212?s=328&d=identicon&r=PG",
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 24.0),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  child: CustomTextField(
                    controller: searchTextFieldEditingController,
                    textHint: 'Search',
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 32.0),
            sliver: SliverToBoxAdapter(
              child: DashboardStats(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 32.0),
            sliver: SliverToBoxAdapter(
              child: DashboardToday(),
            ),
          ),
        ],
      ),
    );
  }
}
