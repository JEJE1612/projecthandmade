import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';

class BackGroundBrodect extends StatelessWidget {
  const BackGroundBrodect({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    image,
                  )),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )),
        ),
        if (UserBloc.get(context).usermodel?.type != 'Owner')
          Positioned(
            right: 10,
            top: 10,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: primary,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: primary,
                    child: Icon(
                      Icons.shopping_basket,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
