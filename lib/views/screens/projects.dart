import 'package:Diligent/config/style.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/views/widgets/heading_title.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  final List<Project> projectList;

  const Projects({Key key, @required this.projectList}) : super(key: key);

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
              title: "Projects",
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 32.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: this.projectList.map((el) {
                  return _ListItem(
                    nbActivities: el.activities.length,
                    project: el,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final Project project;
  final int nbActivities;

  const _ListItem({
    Key key,
    @required this.project,
    @required this.nbActivities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: Style.cardShadow,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        this.project.label,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${this.nbActivities} activities",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            "22/02/2021",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
