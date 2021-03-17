import 'dart:convert';

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

  Map<String, dynamic> toJson() {
    List<String> activitiesString = [];
    this.activities.forEach((act) {
      activitiesString.add(json.encode(act.toJson()));
    });
    return {'label': label, 'id': id, 'activities': activitiesString};
  }

  static Project fromJson(Map<String, dynamic> jsonObj) {
    var label = jsonObj['label'];
    var id = jsonObj['id'];
    List<Activity> activities =
        (jsonObj['activities'] as List).map((itemActivity) {
      print(itemActivity);
      return Activity.fromJson(json.decode(itemActivity));
    }).toList();
    return Project(activities: activities, label: label, id: id);
  }

  // Project.fromJson(Map<String, dynamic> json)
  //     : label = json['label'],
  //       id = json['id'],
  //       activities = json['activities'];
}
