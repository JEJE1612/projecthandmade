import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/order_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_state.dart';

class CarProdectPage extends StatelessWidget {
  const CarProdectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..getOrders(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: textWhite,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: const Center(
                      child: Text(
                        "Car_Prodect",
                        style: TextStyle(
                            fontSize: 18,
                            color: textBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: light,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 3,
                        ),
                        itemCount: OrderCubit.get(context).order.length,
                        itemBuilder: (context, index) => CarItems(
                          model: OrderCubit.get(context).order[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarItems extends StatelessWidget {
  const CarItems({
    super.key,
    required this.model,
  });
  final OrdersModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.18,
        child: Row(children: [
          Container(
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(12),
                    bottomStart: Radius.circular(12)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      model.productimage ?? "",
                    ))),
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: Text(
                          "By_it",
                          style:
                              Styles.textStyle16.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    model.productname ?? "",
                    style: Styles.textStyle16,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.price ?? "",
                            style: Styles.textStyle18.copyWith(color: primary),
                          ),
                          const Gap(5),
                          const Icon(
                            Icons.attach_money,
                            color: secondary,
                          ),
                          const Gap(5),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              OrderCubit.get(context)
                                  .removeCar(orderId: model.orderid ?? "");
                            },
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: secondary,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
