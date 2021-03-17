import 'dart:convert';

import 'package:Diligent/config/palette.dart';
import 'package:Diligent/data/activities.dart';
import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/create_project_delegate.dart';
import 'package:Diligent/presenters/presenters/create_project_presenter.dart';
import 'package:Diligent/utils/utils.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProject extends StatefulWidget {
  final createProjectPresenter = CreateProjectPresenter();
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject>
    implements CreateProjectDelegate {
  final projectNameFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.widget.createProjectPresenter.delegate = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
                floating: true,
                iconTheme: IconThemeData(color: Palette.primary),
                title: Text(
                  "Create project",
                  style: TextStyle(color: Palette.primary),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomTextField(
                        controller: projectNameFieldController,
                        textHint: "Project name",
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                sliver: SliverToBoxAdapter(
                  child: MaterialButton(
                    onPressed: () {
                      this.widget.createProjectPresenter.processProjectName(
                            projectNameFieldController.text,
                            1,
                          );
                    },
                    color: Palette.secondary,
                    elevation: 0.0,
                    minWidth: 0.0,
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text("Submit"),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("OK"),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          )
        ],
      ),
    );
  }

  void testUserDefaults(Project project) async {
    var listFromMemory = UserDefaults.getStringList(Storage.projects);

    listFromMemory.forEach((s) {
      Project p = Project.fromJson(json.decode(s));
      print('PROJECT${p.id} ${p.label}');
      p.activities.forEach((a) {
        print(a.toJson());
      });
    });
  }

  @override
  void saveProject(Project project) {
    // TODO: implement saveProject
    var listFromMemory = UserDefaults.getStringList(Storage.projects);
    if (listFromMemory == null) {
      listFromMemory = [];
    }

    listFromMemory.add(json.encode(project.toJson()));
    UserDefaults.setStringList(Storage.projects, listFromMemory);
    testUserDefaults(project);
    Navigator.of(context).pop();
  }

  @override
  void showAlertDialog(String title, String content) {
    this.displayDialog(title, content);
  }
}
