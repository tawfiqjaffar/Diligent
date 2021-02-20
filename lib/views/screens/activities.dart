import 'package:Diligent/views/widgets/custom_app_bar.dart';
import 'package:Diligent/views/widgets/heading_title.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            child: HeadingTitle(
              title: "Activities",
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 24.0),
          sliver: SliverToBoxAdapter(
            child: HeadingTitle(
              title: "Activities",
            ),
          ),
        ),
      ],
    );
  }
}
