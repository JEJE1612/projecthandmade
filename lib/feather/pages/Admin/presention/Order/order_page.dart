import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/data/model/order_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_state.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..getOrdersOwner(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const CustomAppBarOwner(text: "Orders"),
                  Expanded(
                    child: Container(
                      color: light,
                      child: ListView.separated(
                        itemBuilder: (context, index) => OrderListItem(
                          model: OrderCubit.get(context).orderOwner[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemCount: OrderCubit.get(context).orderOwner.length,
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

class CustomAppBarOwner extends StatelessWidget {
  const CustomAppBarOwner({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textWhite,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, color: textBlack, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.model,
  });
  final OrdersModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: textWhite,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: leftMainPadding,
            right: rightMainPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(model.userImage ?? "")),
              const Gap(5),
              Text(
                model.userName ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  color: textBlack,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.productname ?? "",
                    style: const TextStyle(
                        fontSize: 18,
                        color: textBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    model.date ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      color: grey,
                    ),
                  ),
                ],
              ),
              Text(
                "Price:" "${model.price ?? ""}",
                style: TextStyle(
                    fontSize: 18,
                    color: secondary,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
