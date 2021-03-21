import 'package:Diligent/config/palette.dart';
import 'package:Diligent/config/style.dart';
import 'package:Diligent/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class DashboardStats extends StatelessWidget {
  final List<Project> projectList = Project.readFromMemory();

  List<List<String>> getStats() {
    List<List<String>> stats = [];

    // finished projects
    List<Project> finishedProj = Project.filterFinishedProjects(projectList);
    stats.add(["Acquired skills", finishedProj.length.toString()]);

    // ongoing proects

    int ongoing = projectList.length - finishedProj.length;
    stats.add(["Ongoing projects", ongoing.toString()]);

    // number of activities

    int numberOfAct = Project.filterOngoingActivities(projectList).length;
    stats.add(["Ongoing activities", numberOfAct.toString()]);

    return stats;
  }

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
                    title: getStats()[index][0],
                    content: getStats()[index][1],
                  );
                },
                itemCount: getStats().length,
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
  final String title;
  final String content;

  const _ListItem({
    Key key,
    @required this.isFirst,
    @required this.isLast,
    @required this.dimension,
    @required this.title,
    @required this.content,
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
          boxShadow: Style.cardShadow,
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
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  child: Text(
                    content,
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
