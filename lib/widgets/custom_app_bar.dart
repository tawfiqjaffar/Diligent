import 'package:Diligent/config/palette.dart';
import 'package:Diligent/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

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
                    onPressed: () {},
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
