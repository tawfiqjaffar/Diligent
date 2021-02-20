import 'package:Diligent/models/models.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';

abstract class DashboardTodayDelegate implements Delegate {
  void displayTodaysProjectActivities(List<Project> today);
}
