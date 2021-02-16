import 'package:Diligent/config/style.dart';
import 'package:Diligent/data/activities.dart';
import 'package:Diligent/data/projects.dart';
import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:Diligent/presenters/delegates/dashboard_today_delegate.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class DashboardToday extends StatelessWidget {
  List<Widget> getTodaysActivities() {
    var listItems = [
      DashboardHeading(text: "Today"),
      SizedBox(height: 16.0),
    ];
    var isFirst = true;
    projects.forEach((el) {
      el.activities.forEach((act) {
        listItems.add(_ListItem(
          activity: act,
          project: el,
          presenter: DashboardTodayPresenter(),
          isFirst: isFirst,
        ));
        isFirst = false;
      });
    });
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

class _ListItem extends StatefulWidget {
  final bool isFirst;
  final Activity activity;
  final Project project;
  final DashboardTodayPresenter presenter;

  const _ListItem({
    Key key,
    this.isFirst = false,
    @required this.activity,
    @required this.presenter,
    this.project,
  }) : super(key: key);

  @override
  __ListItemState createState() => __ListItemState();
}

class __ListItemState extends State<_ListItem>
    implements DashboardTodayDelegate {
  String _projectName = "";
  final List<Project> _projects = [];

  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
    this.getProjects();
    // this
    //     .widget
    //     .presenter
    //     .displayProjectNameFromActivity(this.widget.activity, this._projects);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(8.0, (!widget.isFirst) ? 16.0 : 0.0, 8.0, 0.0),
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
                        this.widget.activity.label,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        this.widget.project.label,
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

  void getProjects() {
    setState(() {
      this._projects.clear();
      this._projects.addAll(projects);
    });
  }

  @override
  void displayProjectName(String projectName) {
    setState(() {
      this._projectName = projectName;
    });
  }
}
