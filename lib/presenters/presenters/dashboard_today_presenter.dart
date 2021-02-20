import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/dashboard_today_delegate.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';
import 'package:Diligent/utils/date_time.dart';

class DashboardTodayPresenter implements Presenter {
  @override
  Delegate delegate;

  void getTodayProjects(List<Project> projects) {
    final delegate = this.delegate as DashboardTodayDelegate;
    final List<Project> result = [];

    projects.forEach((project) {
      var tempProject = Project(
        activities: [],
        id: project.id,
        label: project.label,
      );
      project.activities.forEach((activity) {
        if (DateTimeHelper.isToday(activity.start)) {
          tempProject.activities.add(activity);
        }
      });
      result.add(tempProject);
    });
    delegate.displayTodaysProjectActivities(result);
  }
}
