import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';
import 'package:Diligent/utils/date_time.dart';

class ActivitiesPresenter implements Presenter {
  @override
  Delegate delegate;

  void getFutureProjects(List<Project> projects, ActivitiesDelegate _delegate) {
    final delegate = this.delegate as ActivitiesDelegate;
    final List<Project> result = [];

    projects.forEach((project) {
      var tempProject = Project(
        activities: [],
        id: project.id,
        label: project.label,
      );
      project.activities.forEach((activity) {
        if (DateTimeHelper.isFuture(activity.start) && activity.end == null) {
          tempProject.activities.add(activity);
        }
      });
      tempProject.activities.sort((previous, next) {
        return previous.start.isBefore(next.start) ? -1 : 1;
      });
      result.add(tempProject);
    });
    result.sort((previous, next) {
      return previous.label.compareTo(next.label);
    });
    _delegate?.displayFutureProjectActivities(result);
  }
}
