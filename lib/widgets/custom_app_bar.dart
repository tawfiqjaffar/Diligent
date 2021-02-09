import 'package:Diligent/config/palette.dart';
import 'package:Diligent/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String imgUrl;

  const CustomAppBar({Key key, this.imgUrl = "default"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 12.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
                // color: Colors.blue,
                textColor: Palette.primary,
                child: Icon(
                  Icons.notifications,
                  size: 32,
                ),
                padding: EdgeInsets.all(8),
                shape: CircleBorder(),
              )
            ],
          )
        ],
      ),
    );
  }
}
