import 'package:Diligent/models/activity.dart';
import 'package:meta/meta.dart';

class Project {
  final int id;
  final String label;

  final List<Activity> activities;

  Project({
    @required this.activities,
    @required this.id,
    @required this.label,
  });
}
