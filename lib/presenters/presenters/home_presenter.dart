import 'package:Diligent/data/projects.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/delegates/home_delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';

class HomePresenter implements Presenter {
  @override
  Delegate delegate;

  void getProjects() {
    final delegate = this.delegate as HomeDelegate;
    final projectsList = projects;
    delegate.displayProjects(projectsList);
  }
}
