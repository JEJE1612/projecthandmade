import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_state.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';

class BackGroundBrodect extends StatefulWidget {
  const BackGroundBrodect({
    super.key,
    required this.image,
    required this.prodect,
  });
  final String image;
  final ProdectModel prodect;

  @override
  State<BackGroundBrodect> createState() => _BackGroundBrodectState();
}

Color isActive = Colors.white;

class _BackGroundBrodectState extends State<BackGroundBrodect> {
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
                    widget.image,
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
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isActive = secondary;
                        });

                        OrderCubit.get(context).creatCar(
                          context: context,
                          productid: widget.prodect.prodectuid ?? "",
                          price: widget.prodect.price ?? "",
                          ownerUid: widget.prodect.uid ?? "",
                          productname: widget.prodect.prodectname ?? "",
                          productimage: widget.prodect.prodectImage ?? "",
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: primary,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
