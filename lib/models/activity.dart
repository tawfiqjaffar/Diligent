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

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'id': id,
      'projectId': projectId,
      'dateTimeStart': start.toString(),
      'dateTimeEnd': end.toString(),
    };
  }

  Activity.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        id = json['id'],
        projectId = json['projectId'],
        start = DateTime.parse(json['dateTimeStart']),
        end = json['dateTimeEnd'] == "null"
            ? null
            : DateTime.parse(json['dateTimeEnd']);
}
