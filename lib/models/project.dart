import 'dart:convert';

import 'package:Diligent/models/activity.dart';
import 'package:Diligent/utils/utils.dart';
import 'package:meta/meta.dart';

class Project {
  final String id;
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

  static List<Project> readFromMemory() {
    var listFromMemory = UserDefaults.getStringList(Storage.projects);
    List<Project> result = [];

    listFromMemory.forEach((s) {
      Project p = Project.fromJson(json.decode(s));
      result.add(p);
    });

    return result;
  }

  static void saveProject(Project project) {
    var listFromMemory = UserDefaults.getStringList(Storage.projects);
    if (listFromMemory == null) {
      listFromMemory = [];
    }

    listFromMemory.add(json.encode(project.toJson()));
    UserDefaults.setStringList(Storage.projects, listFromMemory);
  }

  static bool saveActivity(String projectId, Activity activity) {
    var listFromMemory = UserDefaults.getStringList(Storage.projects);
    if (listFromMemory == null) {
      listFromMemory = [];
      return false;
    }
    List<String> toSave = [];
    listFromMemory.forEach((stringProject) {
      Project p = Project.fromJson(json.decode(stringProject));
      if (p.id == projectId) {
        p.activities.add(activity);
      }
      toSave.add(json.encode(p.toJson()));
    });
    UserDefaults.setStringList(Storage.projects, toSave);
    return true;
  }

  // Project.fromJson(Map<String, dynamic> json)
  //     : label = json['label'],
  //       id = json['id'],
  //       activities = json['activities'];
}
