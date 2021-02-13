import 'package:Diligent/config/palette.dart';
import 'package:Diligent/config/style.dart';
import 'package:Diligent/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemHeightWidth = 160;
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardHeading(
              text: "Stats",
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: itemHeightWidth,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _ListItem(
                    isFirst: index == 0,
                    isLast: index == 2,
                    dimension: itemHeightWidth,
                  );
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 8.0);
                },
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class _ListItem extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final double dimension;

  const _ListItem({
    Key key,
    @required this.isFirst,
    @required this.isLast,
    @required this.dimension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isFirst ? 8.0 : 0.0,
        0.0,
        isLast ? 8.0 : 0.0,
        10.0,
      ),
      child: Container(
        width: dimension,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(dimension / 4)),
          boxShadow: Style.containerShadow,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: Palette.getRandomGradient(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  "Stat title",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  child: Text(
                    "Stat title",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
