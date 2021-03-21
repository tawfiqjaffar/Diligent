import 'dart:io';

import 'package:Diligent/config/palette.dart';
import 'package:Diligent/models/models.dart';
import 'package:Diligent/utils/user_defaults.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _imageFile;
  _AcquiredSkills acSkills = _AcquiredSkills();

  @override
  void initState() {
    super.initState();
    String profileImagePath = UserDefaults.getString(Storage.profileImage);
    if (profileImagePath != null && profileImagePath != 'default') {
      getApplicationDocumentsDirectory().then((result) {
        try {
          final dirPath = result.path;
          setState(() {
            _imageFile = File("$dirPath/$profileImagePath");
          });
        } catch (e) {}
      }).catchError((err) {});
    }
  }

  _takePicture() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  /// Crop Image
  Future<Null> _cropImage(filePath) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      _imageFile = croppedImage;
      setState(() {});

      _saveImage(_imageFile);
    }
  }

  _saveImage(File toSave) async {
    try {
      final sysPath = await getApplicationDocumentsDirectory();
      final dirPath = sysPath.path;
      final imgType = toSave.path.split('.').last;
      final newImageName = "${DateTime.now()}.$imgType";
      // ignore: unused_local_variable
      final newImage = await toSave.copy('$dirPath/$newImageName');
      UserDefaults.setString(Storage.profileImage, "$newImageName");
    } catch (e) {}
  }

  Image openFile() {
    try {
      return Image.file(_imageFile);
    } catch (e) {
      return Image.network(
        "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            setState(() {
              acSkills = null;
            });
            await Future<void>.delayed(const Duration(milliseconds: 1000));
            setState(() {
              acSkills = _AcquiredSkills();
            });
          },
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 24.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              child: Center(
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () {
                        final act = CupertinoActionSheet(
                            title: Text('New profile picture'),
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text('Choose from gallery'),
                                onPressed: () {
                                  print('pressed action');
                                  Navigator.pop(context);
                                  _getFromGallery();
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text('Take picture'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _takePicture();
                                },
                              ),
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
                      child: CircleAvatar(
                        radius: 64.0,
                        child: ClipOval(
                          child: _imageFile == null
                              ? Image.network(
                                  "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png")
                              : openFile(),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Icon(
                        Icons.camera_alt,
                        color: Palette.primary,
                      ),
                      right: -10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 24.0),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: Text(
                UserDefaults.getString(Storage.userName),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.primary,
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 36.0),
          sliver: SliverToBoxAdapter(
            child: acSkills,
          ),
        ),
      ],
    );
  }
}

class _AcquiredSkills extends StatefulWidget {
  @override
  __AcquiredSkillsState createState() => __AcquiredSkillsState();
}

class __AcquiredSkillsState extends State<_AcquiredSkills> {
  final List<Widget> _skills = [];

  List<Project> projects = [];

  void _getProjects() {
    setState(() {
      List<Project> projectList = Project.readFromMemory();
      setState(() {
        projects = Project.filterFinishedProjects(projectList);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardHeading(text: "Acquired Skills"),
        Column(
          children: this.projects.map((el) {
            return ProjectRow(
              project: el,
              nbActivities: el.activities.length,
            );
          }).toList(),
        ),
      ],
    );
  }
}
