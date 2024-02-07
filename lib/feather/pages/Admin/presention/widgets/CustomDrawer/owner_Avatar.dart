import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OwnerAvatar extends StatelessWidget {
  const OwnerAvatar({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundImage: CachedNetworkImageProvider(image),
    );
  }
}
