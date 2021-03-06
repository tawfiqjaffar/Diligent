import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';

abstract class HomeDelegate extends Delegate {
  void displayProjects(List<Project> projects);
  void redirectToLogin();
}
