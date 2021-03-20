import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/dashboard_today_delegate.dart';
import 'package:Diligent/presenters/presenters/activity_row_presenter.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'widgets.dart';

class DashboardToday extends StatefulWidget {
  final DashboardTodayPresenter presenter = DashboardTodayPresenter();

  // _DashboardTodayState todayState;

  DashboardToday({Key key}) : super(key: key);

  @override
  _DashboardTodayState createState() {
    return _DashboardTodayState();
  }
}

class _DashboardTodayState extends State<DashboardToday>
    implements DashboardTodayDelegate {
  final List<Widget> _today = [];
  List<Project> projects = [];

  void refreshData() {
    projects = Project.readFromMemory();

    this.widget.presenter.getTodayProjects(projects, this);
  }

  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
    projects = Project.readFromMemory();
    this.widget.presenter.getTodayProjects(projects, this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardHeading(text: "Today"),
          SizedBox(height: 16.0),
          ..._today
        ],
      ),
    );
  }

  @override
  void displayTodaysProjectActivities(List<Project> today) {
    setState(() {
      var isFirst = true;
      this._today.clear();
      today.forEach((el) {
        el.activities.forEach((act) {
          final ActivityRowPresenter presenter = ActivityRowPresenter();

          presenter.dashboardTodayDelegate = this;
          this._today.add(ActivityRow(
              activity: act,
              project: el,
              isFirst: isFirst,
              dashboardTodayDelegate: this,
              activitiesDelegate: null,
              activitiesPresenter: null,
              dashboardTodayPresenter: this.widget.presenter,
              presenter: presenter));
          isFirst = false;
        });
      });
    });
  }
}
