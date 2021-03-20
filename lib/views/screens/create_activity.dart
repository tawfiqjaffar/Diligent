import 'package:Diligent/config/palette.dart';
import 'package:Diligent/models/activity.dart';
import 'package:Diligent/models/project.dart';
import 'package:Diligent/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CreateActivity extends StatefulWidget {
  @override
  _CreateActivityState createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  final _activityNameFieldController = TextEditingController();

  Project _selectedProject;
  DateTime _startDate;
  List<bool> filledFields = [false, false, false];

  void _saveActivity() {
    if (_activityNameFieldController.text.isNotEmpty &&
        _selectedProject != null &&
        _startDate != null) {
      Uuid uuid = Uuid();
      var activity = Activity(
          projectId: _selectedProject.id,
          id: uuid.v1(),
          label: _activityNameFieldController.text,
          start: _startDate);
      _selectedProject.activities.add(activity);
      Project.saveActivity(_selectedProject.id, activity);
      print(activity.toJson());
      Navigator.of(context).pop();
    }
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 300,
              child: CupertinoDatePicker(
                  minimumDate: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime dateTime) {
                    setState(() {
                      _startDate = dateTime;
                    });
                  }),
            ));
  }

  void _showPicker(BuildContext context) {
    List<Project> projects = Project.readFromMemory();
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        child: CupertinoPicker(
          backgroundColor: Palette.scaffold,
          itemExtent: 50,
          scrollController: FixedExtentScrollController(initialItem: 1),
          children: projects
              .map((e) => Center(
                    child: Text(e.label),
                  ))
              .toList(),
          onSelectedItemChanged: (position) {
            setState(() {
              this._selectedProject = projects[position];
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
                floating: true,
                iconTheme: IconThemeData(color: Palette.primary),
                title: Text(
                  "Create activity",
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
                        controller: _activityNameFieldController,
                        textHint: "Activity name",
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add to project: ",
                        style: const TextStyle(
                            color: Palette.primary,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 120,
                        child: _selectedProject == null
                            ? _Button(
                                isEnabled: true,
                                text: "Select",
                                onTap: () {
                                  _showPicker(context);
                                })
                            : _Button(
                                isEnabled: true,
                                text: _selectedProject.label,
                                onTap: () {
                                  _showPicker(context);
                                }),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start date:",
                        style: const TextStyle(
                            color: Palette.primary,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 175,
                        child: _startDate == null
                            ? _Button(
                                isEnabled: true,
                                text: "Select",
                                onTap: () {
                                  _showDatePicker(context);
                                })
                            : _Button(
                                isEnabled: true,
                                text: DateFormat("MMM dd, yyyy")
                                    .format(_startDate),
                                onTap: () {
                                  _showDatePicker(context);
                                }),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                sliver: SliverToBoxAdapter(
                  child: _Button(
                    isEnabled: _activityNameFieldController.text.isNotEmpty &&
                        _selectedProject != null &&
                        _startDate != null,
                    onTap: () {
                      _saveActivity();
                    },
                    text: "Submit",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;

  final Function onTap;

  final bool isEnabled;

  const _Button({
    Key key,
    @required this.isEnabled,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.grey,
      onPressed: isEnabled
          ? () {
              this.onTap();
            }
          : null,
      color: Palette.secondary,
      elevation: 3.0,
      minWidth: 0.0,
      textColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Center(
          child: Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
