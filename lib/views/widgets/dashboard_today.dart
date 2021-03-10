import 'package:Diligent/data/projects.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/dashboard_today_delegate.dart';
import 'package:Diligent/presenters/presenters/activity_row_presenter.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class DashboardToday extends StatefulWidget {
  final DashboardTodayPresenter presenter;

  const DashboardToday({
    Key key,
    @required this.presenter,
  }) : super(key: key);
  @override
  _DashboardTodayState createState() => _DashboardTodayState();
}

class _DashboardTodayState extends State<DashboardToday>
    implements DashboardTodayDelegate {
  final List<Widget> _today = [];
  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
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
