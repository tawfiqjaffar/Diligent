import 'package:meta/meta.dart';

class Activity {
  final int id;
  final String label;
  final DateTime start;
  final int projectId;
  DateTime end;

  Activity({
    @required this.projectId,
    @required this.id,
    @required this.label,
    @required this.start,
  });
}
