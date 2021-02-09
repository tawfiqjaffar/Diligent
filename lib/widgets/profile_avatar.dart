import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imgUrl;

  const ProfileAvatar({
    Key key,
    this.imgUrl = "default",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 22.0,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: imgUrl == "default"
                  ? CachedNetworkImageProvider(
                      "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png")
                  : CachedNetworkImageProvider(
                      imgUrl,
                    )),
        )
      ],
    );
  }
}
