import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/home_delegate.dart';
import 'package:Diligent/presenters/presenters/presenters.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeTest implements HomeDelegate {
  final List<Project> projects = [];
  @override
  void displayProjects(List<Project> projects) {
    this.projects.clear();
    this.projects.addAll(projects);
  }

  @override
  void redirectToLogin() {}
}

void main() {
  test('Tests retrived project list is not empty', () {
    // GIVEN
    final presenter = HomePresenter();
    final home = HomeTest();
    presenter.delegate = home;

    // WHEN
    presenter.getProjects();

    // THEN
    expect(home.projects.length > 0, true);
  });
}
