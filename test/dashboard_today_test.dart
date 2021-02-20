import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/presenters/dashboard_today_presenter.dart';
import 'package:Diligent/presenters/delegates/delegates.dart';
import 'package:flutter_test/flutter_test.dart';

class DashboardTodayTest implements DashboardTodayDelegate {
  final List<Project> projects = [];

  @override
  void displayTodaysProjectActivities(List<Project> today) {
    projects.clear();
    projects.addAll(today);
  }
}

void main() {
  test('Should return a list of projects with today\'s activities', () {
    // GIVEN
    final Activity activity = Activity(
      projectId: 0,
      id: 0,
      label: "Activity0",
      start: DateTime.now(),
    );
    final project = Project(
      id: 0,
      label: "Project0",
      activities: [activity],
    );
    final dashboardToday = DashboardTodayTest();
    final presenter = DashboardTodayPresenter();
    presenter.delegate = dashboardToday;

    // WHEN
    presenter.getTodayProjects([project]);

    // THEN
    expect(dashboardToday.projects.isNotEmpty, true);
    dashboardToday.projects.forEach((act) {
      expect(act.activities.isNotEmpty, true);
    });
  });

  test('Should return a list of projects with an empty list of activities', () {
    // GIVEN
    final now = DateTime.now();
    final Activity activity = Activity(
      projectId: 1,
      id: 0,
      label: "Activity0",
      start: DateTime(now.year + 1),
    );
    final project = Project(
      id: 0,
      label: "Project0",
      activities: [activity],
    );
    final dashboardToday = DashboardTodayTest();
    final presenter = DashboardTodayPresenter();
    presenter.delegate = dashboardToday;

    // WHEN
    presenter.getTodayProjects([project]);

    // THEN
    expect(dashboardToday.projects.isNotEmpty, true);
    dashboardToday.projects.forEach((act) {
      expect(act.activities.isNotEmpty, false);
    });
  });
}
