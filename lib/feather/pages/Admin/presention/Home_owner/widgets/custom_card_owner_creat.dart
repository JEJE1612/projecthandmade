import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';

class CustomCardOwnerCreat extends StatelessWidget {
  const CustomCardOwnerCreat({
    super.key,
  });

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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Colors.amber,
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(
                      color: primary,
                      fontSize: 18,
                    ),
                  ),
                  Gap(3),
                  Row(
                    children: [
                      Text(
                        "NameProdect",
                        style: TextStyle(
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
                    "it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum ",
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
                            "220",
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
                            "   5    ",
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
