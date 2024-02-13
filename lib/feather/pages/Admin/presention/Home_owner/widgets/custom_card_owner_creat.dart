import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';

class CustomCardOwnerCreat extends StatelessWidget {
  const CustomCardOwnerCreat({
    super.key,
    required this.model,
  });
  final ProdectModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        clipBehavior: Clip.none,
        color: textWhite,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      "${model.prodectImage}",
                    )),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name:",
                    style: TextStyle(
                      color: primary,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(3),
                  Row(
                    children: [
                      Text(
                        "${model.prodectname}",
                        style: const TextStyle(
                            color: textBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Gap(2),
                  Text(
                    "Dicridaction",
                    style: TextStyle(
                      color: primary,
                      fontSize: 18,
                    ),
                  ),
                  Gap(3),
                  Text(
                    "${model.text}",
                    maxLines: 4,
                    style: TextStyle(
                      color: textBlack,
                      fontSize: 14,
                    ),
                  ),
                  Gap(2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "price",
                            style: TextStyle(
                              color: primary,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${model.price}",
                            style: TextStyle(
                                color: textBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "paces",
                            style: TextStyle(
                              color: primary,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${model.pace}",
                            style: TextStyle(
                                color: textBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
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
