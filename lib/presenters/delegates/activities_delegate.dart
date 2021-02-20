import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';

abstract class ActivitiesDelegate implements Delegate {
  void displayFutureProjectActivities(List<Project> future);
}
