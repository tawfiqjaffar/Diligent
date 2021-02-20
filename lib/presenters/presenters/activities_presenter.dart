import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';
import 'package:Diligent/utils/date_time.dart';

class ActivitiesPresenter implements Presenter {
  @override
  Delegate delegate;

  void getFutureProjects(List<Project> projects) {
    final delegate = this.delegate as ActivitiesDelegate;
    final List<Project> result = [];

    projects.forEach((project) {
      var tempProject = Project(
        activities: [],
        id: project.id,
        label: project.label,
      );
      project.activities.forEach((activity) {
        if (DateTimeHelper.isFuture(activity.start)) {
          tempProject.activities.add(activity);
        }
      });
      result.add(tempProject);
    });
    delegate.displayFutureProjectActivities(result);
  }
}
