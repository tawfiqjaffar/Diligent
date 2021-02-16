import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:flutter_test/flutter_test.dart';

class DashboardTodayTest implements DashboardTodayDelegate {
  String projectName;
  @override
  void displayProjectName(String projectName) {
    this.projectName = projectName;
  }
}

void main() {
  test('Tests correct project name retrieval', () {
    // GIVEN
    final Activity activity = Activity(
      projectId: 0,
      id: 0,
      label: "Activity0",
      start: DateTime.now(),
    );
    final project = Project(id: 0, label: "Project0", activities: []);
    final dashboardToday = DashboardTodayTest();
    final presenter = DashboardTodayPresenter();
    presenter.delegate = dashboardToday;

    // WHEN
    presenter.displayProjectNameFromActivity(activity, [project]);

    // THEN
    expect(dashboardToday.projectName, "Project0");
  });

  test('Tests incorrect project name retrieval', () {
    // GIVEN
    final Activity activity = Activity(
      projectId: 1,
      id: 0,
      label: "Activity0",
      start: DateTime.now(),
    );
    final project = Project(id: 0, label: "Project0", activities: []);
    final dashboardToday = DashboardTodayTest();
    final presenter = DashboardTodayPresenter();
    presenter.delegate = dashboardToday;

    // WHEN
    presenter.displayProjectNameFromActivity(activity, [project]);

    // THEN
    expect(dashboardToday.projectName, "n/a");
  });
}
