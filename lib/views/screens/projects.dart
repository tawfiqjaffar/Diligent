import 'package:Diligent/config/style.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/views/widgets/heading_title.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
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
          flexibleSpace: CustomAppBar(),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: () {},
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
                  return ProjectRow(
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
