import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/dashboard_today_delegate.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';

class DashboardTodayPresenter implements Presenter {
  @override
  Delegate delegate;

  void displayProjectNameFromActivity(
      Activity activity, List<Project> projects) {
    final delegate = this.delegate as DashboardTodayDelegate;
    final int projectId = activity.projectId;
    final project = projects.firstWhere(
      (element) => element.id == projectId,
      orElse: () => null,
    );
    if (project == null) {
      delegate.displayProjectName("n/a");
    } else {
      delegate.displayProjectName(project.label);
    }
  }
}
