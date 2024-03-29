import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/user/management/bloc.dart';

import 'package:handmade/feather/user/presentation/favourte/product/prodect/favorate_products_details_screen .dart';

class FavorateProductsCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
   final String id;
  const FavorateProductsCard({
    super.key,
    //required this.product,
    required this.isShowDeleteButton,
    required this.image,
    required this.name,
    required this.price, required this.id,
  });

  //final Product product;
  final bool isShowDeleteButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FavorateProductsDetailsScreen()));
        //  Get.to(() => ProductsDetailsScreen(productsId: product.id!));
      },
      child: Card(
        elevation: 5,
        shadowColor: primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: primary.withOpacity(0.2),
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        // Wrap(
                        //   crossAxisAlignment: WrapCrossAlignment.center,
                        //   children: [
                        //     const Icon(
                        //       Icons.star,
                        //       size: 15,
                        //       color: Colors.amber,
                        //     ),
                        //     Text(
                        //       "4.0",
                        //       style: TextStyle(
                        //         overflow: TextOverflow.ellipsis,
                        //         fontSize: 13,
                        //         color: Colors.grey.shade600,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            color: primary,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                isShowDeleteButton == false
                                    ? Icons.favorite_border
                                    : Icons.delete,
                                size: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          onTap: () {
                            MyBloc.get(context).deleteProdect(id);
                          },
                        )
                      ],
                    )
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
