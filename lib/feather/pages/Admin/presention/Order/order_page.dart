import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarOwner(text: "Orders"),
            Expanded(
              child: Container(
                color: light,
                child: ListView.separated(
                    itemBuilder: (context, index) => const OrderListItem(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: 3),
              ),
            ),
          ],
        ),
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
  });

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
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  'assets/images/man_4140037.png',
                ),
              ),
              const Gap(5),
              const Text(
                "Ahmed",
                style: TextStyle(
                  fontSize: 18,
                  color: textBlack,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline)),
            ],
          ),
          const Gap(20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "prodect Name",
                    style: TextStyle(
                        fontSize: 18,
                        color: textBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "20/5/2020",
                    style: TextStyle(
                      fontSize: 14,
                      color: grey,
                    ),
                  ),
                ],
              ),
              Text(
                "Price:" "220",
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
