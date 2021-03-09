import 'package:Diligent/data/activities.dart';
import 'package:Diligent/models/project.dart';

final List<Project> projects = [
  Project(id: 0, label: "C for beginners", activities: cProgActivities),
  Project(id: 1, label: "C++ for beginners", activities: cPPProgActivities),
  Project(
      id: 2, label: "Java Spring boot/Hibernate", activities: javaActivities)
];
