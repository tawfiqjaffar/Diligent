import 'package:Diligent/config/palette.dart';
import 'package:Diligent/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          expandedHeight: screenHeight / 10,
          backgroundColor: Colors.transparent,
          floating: true,
          flexibleSpace: CustomAppBar(
            imgUrl:
                "https://www.gravatar.com/avatar/867e47ad7bfdfa41da4db0b662b1b212?s=328&d=identicon&r=PG",
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: screenHeight * .9,
          color: Colors.red,
        ))
      ],
    );
  }
}
