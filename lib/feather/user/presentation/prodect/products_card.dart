import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/views/prodect_deatils.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
    required this.isShowDeleteButton,
    required this.prodect,
  });

  final bool isShowDeleteButton;
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
                    )));
      },
      child: Card(
        elevation: 20,
        shadowColor: primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.19,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: primary.withOpacity(0.2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        CachedNetworkImageProvider(prodect.prodectImage ?? ""),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${prodect.price}",
                              style: Styles.textStyle16.copyWith(color: grey),
                            ),
                            const Icon(
                              Icons.attach_money,
                              color: secondary,
                            ),
                          ],
                        ),
                        const Gap(3),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Name:",
                          maxLines: 1,
                          style: TextStyle(
                            color: primary,
                            fontSize: 12,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          prodect.prodectname ?? "",
                          maxLines: 1,
                          style: const TextStyle(
                            color: textBlack,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
