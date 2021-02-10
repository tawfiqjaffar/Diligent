import 'package:Diligent/config/palette.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Stats",
                    style: const TextStyle(
                      color: Palette.primary,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              // color: Colors.red,
              height: 150.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _ListItem(
                    isFirst: index == 0,
                    isLast: index == 2,
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

  const _ListItem({
    Key key,
    @required this.isFirst,
    @required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isFirst ? 8.0 : 0.0,
        0.0,
        isLast ? 8.0 : 0.0,
        0.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(37.5),
        child: Container(
          width: 150.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
