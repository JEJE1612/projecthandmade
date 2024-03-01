import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/user/management/bloc.dart';

class CardItemsFavProdectUser extends StatelessWidget {
  const CardItemsFavProdectUser({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.isShowDeleteButton,
  });
  //final ProdectModel prodect;
  final String image;
  final String price;
  final String name;

  final String id;
  final bool isShowDeleteButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ProdectDeatils(
        //         prodect: prodect,
        //       ),
        //     ));
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
                      image ?? "",
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
                              price ?? "",
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
                            onPressed: () {
                              MyBloc.get(context).deleteProdect(id);
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                  Text(
                    name ?? "",
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
