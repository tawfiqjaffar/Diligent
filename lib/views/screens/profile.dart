import 'dart:io';

import 'package:Diligent/config/palette.dart';
import 'package:Diligent/utils/user_defaults.dart';
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

  @override
  void initState() {
    super.initState();
    String profileImagePath = UserDefaults.getString(Storage.profileImage);
    if (profileImagePath != null && profileImagePath != 'default') {
      getApplicationDocumentsDirectory().then((result) {
        try {
          final dirPath = result.path;
          _imageFile = File("$dirPath/$profileImagePath");
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
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          Container(
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
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Tawfiq JAFFAR",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Palette.primary,
            ),
          ),
        ],
      ),
    );
  }
}
