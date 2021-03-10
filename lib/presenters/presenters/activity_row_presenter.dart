import 'package:Diligent/data/projects.dart';
import 'package:Diligent/models/activity.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:Diligent/presenters/presenters/activities_presenter.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';

class ActivityRowPresenter implements Presenter {
  @override
  Delegate delegate;

  ActivitiesDelegate activitiesDelegate;

  DashboardTodayDelegate dashboardTodayDelegate;

  void finishActivity(
      Activity activity,
      ActivitiesPresenter activitiesPresenter,
      DashboardTodayPresenter dashboardTodayPresenter) {
    activity.end = DateTime.now();
    activitiesPresenter?.getFutureProjects(projects, activitiesDelegate);
    dashboardTodayPresenter?.getTodayProjects(projects, dashboardTodayDelegate);
  }
}
