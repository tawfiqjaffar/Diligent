import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/dashboard_today_delegate.dart';

class DashboardTodayPresenter {
  DashboardTodayDelegate delegate;

  void displayProjectNameFromActivity(
      Activity activity, List<Project> projects) {
    final int projectId = activity.projectId;
    final project = projects.firstWhere(
      (element) => element.id == projectId,
      orElse: () => null,
    );
    if (project == null) {
      this.delegate.displayProjectName("n/a");
    } else {
      this.delegate.displayProjectName(project.label);
    }
  }
}