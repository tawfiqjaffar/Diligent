import 'package:Diligent/data/projects.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:Diligent/presenters/presenters/activities_presenter.dart';
import 'package:Diligent/presenters/presenters/activity_row_presenter.dart';
import 'package:Diligent/views/widgets/custom_app_bar.dart';
import 'package:Diligent/views/widgets/heading_title.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  final ActivitiesPresenter presenter = ActivitiesPresenter();
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> implements ActivitiesDelegate {
  final List<Widget> _future = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.presenter.delegate = this;
    this.widget.presenter.getFutureProjects(projects);
  }

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
              child: Column(
            children: [
              ...this._future,
            ],
          )),
        ),
      ],
    );
  }

  @override
  void displayFutureProjectActivities(List<Project> future) {
    setState(() {
      var isFirst = true;
      this._future.clear();
      future.forEach((el) {
        el.activities.forEach((act) {
          this._future.add(
                ActivityRow(
                  activity: act,
                  project: el,
                  isFirst: isFirst,
                  presenter: ActivityRowPresenter(),
                ),
              );
          isFirst = false;
        });
      });
    });
  }
}
