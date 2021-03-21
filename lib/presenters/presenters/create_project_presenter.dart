import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/create_project_delegate.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';
import 'package:uuid/uuid.dart';

class CreateProjectPresenter implements Presenter {
  @override
  Delegate delegate;

  void processProjectName(String name) {
    final uuid = Uuid();
    final delegate = this.delegate as CreateProjectDelegate;

    if (name.isEmpty) {
      delegate.showAlertDialog("Error", "Project name cannot be empty");
    } else {
      final project = Project(label: name, id: uuid.v1(), activities: []);

      delegate?.saveProject(project);
    }
  }
}
