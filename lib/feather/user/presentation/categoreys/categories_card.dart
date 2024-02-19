import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/show_cat.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowProdectCatroies(
                          nameCat: name,
                        )));
          },
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  image,
                ),
                radius: 45,
              ),
              const Gap(10),
              Text(
                name,
                style: Styles.textStyle18,
              )
            ],
          )),
    );
  }
}
