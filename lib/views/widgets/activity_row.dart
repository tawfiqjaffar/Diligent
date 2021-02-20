import 'package:Diligent/config/style.dart';
import 'package:Diligent/data/projects.dart';
import 'package:Diligent/models/models.dart';
import 'package:Diligent/presenters/delegates/activity_row_delegate.dart';
import 'package:Diligent/presenters/presenters/activity_row_presenter.dart';
import 'package:Diligent/utils/date_time.dart';
import 'package:Diligent/views/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ActivityRow extends StatefulWidget {
  final bool isFirst;
  final Activity activity;
  final Project project;
  final ActivityRowPresenter presenter;

  const ActivityRow(
      {Key key,
      this.isFirst = false,
      @required this.activity,
      @required this.project,
      this.presenter})
      : super(key: key);
  @override
  _ActivityRowState createState() => _ActivityRowState();
}

class _ActivityRowState extends State<ActivityRow>
    implements ActivityRowDelegate {
  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(8.0, (!widget.isFirst) ? 16.0 : 0.0, 8.0, 0.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: Style.cardShadow,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ProfileAvatar(
                  imgUrl:
                      "https://assets.materialup.com/uploads/5cda2c2f-9596-403f-946f-f72e70c8e94a/preview.png",
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.widget.activity.label,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        this.widget.project.label,
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    DateTimeHelper.formatToReadable(this.widget.activity.start),
                    textAlign: TextAlign.center,
                    style: const TextStyle(),
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Container(
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          print("no");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          print("no");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 2.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void displayProjectName(String projectName) {}
}
