import 'dart:io';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:path_provider/path_provider.dart';

class ProfileAvatar extends StatefulWidget {
  final String imgUrl;

  const ProfileAvatar({
    Key key,
    @required this.imgUrl,
  }) : super(key: key);

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  Image _img;

  openFile() {
    try {
      getApplicationDocumentsDirectory().then((res) {
        final dirPath = res.path;
        setState(() {
          _img = Image.file(File("$dirPath/${widget.imgUrl}"));
        });
      }).catchError((e) {
        setState(() {
          _img = Image.network(
              "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png");
        });
      });
    } catch (e) {
      setState(() {
        _img = Image.network(
            "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FocusDetector(
          onFocusGained: () {
            openFile();
          },
          child: CircleAvatar(
            radius: 22.0,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[200],
              child: ClipOval(
                  child: widget.imgUrl == "default"
                      ? Image.network(
                          "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png")
                      : _img),
            ),
          ),
        )
      ],
    );
  }
}
