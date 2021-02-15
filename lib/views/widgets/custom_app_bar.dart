import 'package:Diligent/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final String imgUrl;

  const CustomAppBar({Key key, this.imgUrl = "default"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileAvatar(
                    imgUrl: this.imgUrl,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Text(
                      "Hi, User",
                      style: const TextStyle(
                          color: Palette.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      final act = CupertinoActionSheet(
                          title: Text('What would you like to create?'),
                          actions: [
                            CupertinoActionSheetAction(
                              child: Text('Activity'),
                              onPressed: () {
                                print('pressed action');
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Project'),
                              onPressed: () {
                                print('pressed project');
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Idea'),
                              onPressed: () {
                                print('pressed idea');
                                Navigator.pop(context);
                              },
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) => act);
                    },
                    color: Palette.primary,
                    elevation: 0.0,
                    minWidth: 0.0,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    padding: EdgeInsets.all(8),
                    shape: CircleBorder(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            _PopoverElement(title: "Activity"),
            _PopoverElement(
              title: "Project",
              isMiddle: true,
            ),
            _PopoverElement(title: "Scribble")
          ],
        ),
      ),
    );
  }
}

class _PopoverElement extends StatelessWidget {
  final bool isMiddle;
  final String title;

  const _PopoverElement({Key key, this.isMiddle = false, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.0, vertical: this.isMiddle ? 10.0 : 0.0),
      child: InkWell(
        onTap: () {
          print('GestureDetector was called on Entry A');
          Navigator.of(context).pop();
        },
        child: Container(
          height: 50,
          color: Palette.primary,
          child: Center(
            child: Text(
              this.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
