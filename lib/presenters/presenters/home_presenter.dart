import 'package:Diligent/data/projects.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/delegates/home_delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';
import 'package:Diligent/utils/utils.dart';

class HomePresenter implements Presenter {
  @override
  Delegate delegate;

  bool _checkLoggedIn() {
    final delegate = this.delegate as HomeDelegate;
    final isLoggedIn = UserDefaults.getBool(Storage.isLoggedIn) ?? false;

    if (!isLoggedIn) {
      delegate.redirectToLogin();
      return false;
    }

    return true;
  }

  void getProjects() {
    if (_checkLoggedIn()) {
      final delegate = this.delegate as HomeDelegate;
      final projectsList = projects;
      delegate.displayProjects(projectsList);
    }
  }
}
