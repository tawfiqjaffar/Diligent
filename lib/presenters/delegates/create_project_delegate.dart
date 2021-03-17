import 'package:Diligent/models/project.dart';

import 'delegate.dart';

abstract class CreateProjectDelegate extends Delegate {
  void saveProject(Project project);
  void showAlertDialog(String title, String content);
}
