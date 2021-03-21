import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:Diligent/presenters/presenters/activities_presenter.dart';
import 'package:Diligent/presenters/presenters/activity_row_presenter.dart';
import 'package:Diligent/views/widgets/custom_app_bar.dart';
import 'package:Diligent/views/widgets/heading_title.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
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
    super.initState();
    this.widget.presenter.delegate = this;
    this.widget.presenter.getFutureProjects(Project.readFromMemory(), this);
  }

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
          onRefresh: _refreshData,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 24.0),
          sliver: SliverToBoxAdapter(
            child: HeadingTitle(
              title: "Future Activities",
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
            ),
          ),
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
          final ActivityRowPresenter presenter = ActivityRowPresenter();

          presenter.activitiesDelegate = this;
          this._future.add(
                ActivityRow(
                  activity: act,
                  project: el,
                  dashboardTodayDelegate: null,
                  activitiesDelegate: this,
                  isFirst: isFirst,
                  dashboardTodayPresenter: null,
                  activitiesPresenter: this.widget.presenter,
                  presenter: presenter,
                ),
              );
          isFirst = false;
        });
      });
    });
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    this.widget.presenter.delegate = this;
    var projects = Project.readFromMemory();
    this.widget.presenter.getFutureProjects(Project.readFromMemory(), this);
    return;
  }
}
