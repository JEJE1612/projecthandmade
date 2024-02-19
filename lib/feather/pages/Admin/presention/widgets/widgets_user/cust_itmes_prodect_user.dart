import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/views/prodect_deatils.dart';

class CardItemsProdectUser extends StatelessWidget {
  const CardItemsProdectUser({
    super.key,
    required this.prodect,
  });
  final ProdectModel prodect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProdectDeatils(
                prodect: prodect,
              ),
            ));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      prodect.prodectImage ?? "",
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              prodect.price ?? "",
                              style:
                                  Styles.textStyle16.copyWith(color: primary),
                            ),
                            const Icon(
                              Icons.attach_money,
                              color: secondary,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                  Text(
                    prodect.prodectname ?? "",
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
