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
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: Style.cardShadow,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ProfileAvatar(
                  imgUrl:
                      "https://assets.materialup.com/uploads/5cda2c2f-9596-403f-946f-f72e70c8e94a/preview.png",
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ddocdfasdfr",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Text(
                        "DevOps",
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "DevOps",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Container(
                child: Row(
                  children: [
                    Material(
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          print("no");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Material(
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          print("no");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 2.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
