import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/create_project_delegate.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';

class CreateProjectPresenter implements Presenter {
  @override
  Delegate delegate;

  void processProjectName(String name, int id) {
    final delegate = this.delegate as CreateProjectDelegate;

    if (name.isEmpty) {
      delegate.showAlertDialog("Error", "Project name cannot be empty");
    } else {
      final project = Project(label: name, id: id, activities: [
        Activity(
            id: 0, projectId: 0, label: "${name} act", start: DateTime.now())
      ]);

      delegate?.saveProject(project);
    }
  }
}
