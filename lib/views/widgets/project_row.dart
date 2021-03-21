import 'package:Diligent/config/style.dart';
import 'package:Diligent/models/models.dart';
import 'package:flutter/material.dart';

class ProjectRow extends StatelessWidget {
  final Project project;
  final int nbActivities;

  const ProjectRow({
    Key key,
    @required this.project,
    @required this.nbActivities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: Style.cardShadow,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        this.project.label,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${this.nbActivities} activities",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            "22/02/2021",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
