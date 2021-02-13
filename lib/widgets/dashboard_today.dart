import 'package:Diligent/config/palette.dart';
import 'package:Diligent/config/style.dart';
import 'package:Diligent/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DashboardToday extends StatelessWidget {
  List<Widget> getTodaysActivities() {
    var listItems = [
      DashboardHeading(text: "Today"),
      SizedBox(height: 16.0),
    ];
    var colors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
      Colors.purple
    ];
    for (var i = 0; i < 10; ++i) {
      listItems.add(_ListItem(
        isFirst: i == 0,
      ));
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getTodaysActivities(),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final bool isFirst;

  const _ListItem({Key key, this.isFirst = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, (!isFirst) ? 16.0 : 0.0, 8.0, 0.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: Style.cardShadow,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Activity",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Palette.secondary,
                  fontSize: 22.0,
                ),
              ),
              Text(
                "Project",
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              Text(
                "Test",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
