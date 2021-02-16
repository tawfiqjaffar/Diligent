import 'package:Diligent/models/activity.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';

abstract class ProjectsDelegate extends Delegate {
  void displayActivitiesInfo(List<Activity> activities);
}
