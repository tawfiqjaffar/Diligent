import 'package:Diligent/config/style.dart';
import 'package:Diligent/models/models.dart';
import 'package:Diligent/presenters/delegates/activity_row_delegate.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:Diligent/presenters/presenters/activities_presenter.dart';
import 'package:Diligent/presenters/presenters/activity_row_presenter.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:Diligent/utils/date_time.dart';
import 'package:Diligent/utils/utils.dart';
import 'package:flutter/material.dart';

class ActivityRow extends StatefulWidget {
  final bool isFirst;
  final Activity activity;
  final Project project;
  final ActivitiesPresenter activitiesPresenter;
  final DashboardTodayPresenter dashboardTodayPresenter;
  final ActivityRowPresenter presenter;
  final ActivitiesDelegate activitiesDelegate;
  final DashboardTodayDelegate dashboardTodayDelegate;

  const ActivityRow({
    Key key,
    this.isFirst = false,
    @required this.activity,
    @required this.project,
    this.presenter,
    @required this.activitiesPresenter,
    @required this.dashboardTodayPresenter,
    @required this.activitiesDelegate,
    @required this.dashboardTodayDelegate,
  }) : super(key: key);
  @override
  _ActivityRowState createState() => _ActivityRowState();
}

class _ActivityRowState extends State<ActivityRow>
    implements ActivityRowDelegate {
  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
    this.widget.presenter.activitiesDelegate = this.widget.activitiesDelegate;
    this.widget.presenter.dashboardTodayDelegate =
        this.widget.dashboardTodayDelegate;
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
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Icon(
                  Icons.chevron_right,
                  size: 32.0,
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
                    DateTimeHelper.formatToReadable(this.widget.activity.start),
                    textAlign: TextAlign.center,
                    style: const TextStyle(),
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
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          this.widget.presenter.finishActivity(
                              this.widget.activity,
                              this.widget.activitiesPresenter,
                              this.widget.dashboardTodayPresenter);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
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
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          print("no");
                          UserDefaults.remove(Storage.projects);
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

  @override
  void displayProjectName(String projectName) {}
}
