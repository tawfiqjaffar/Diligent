import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final searchTextFieldEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).unfocus(),
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            floating: true,
            flexibleSpace: CustomAppBar(),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(const Duration(milliseconds: 1000));
              setState(() {});
            },
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
              child: today,
            ),
          ),
          SliverPadding(padding: const EdgeInsets.only(bottom: 16.0))
        ],
      ),
    );
  }
}
