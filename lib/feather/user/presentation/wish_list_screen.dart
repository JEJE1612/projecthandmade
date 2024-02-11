import 'package:flutter/material.dart';
import 'package:handmade/feather/user/presentation/prodect/products_card.dart';

import 'widget/custom_app_bar.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("All Prodects", false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, int index) {
              return const FittedBox(
                child: ProductsCard(
                  isShowDeleteButton: true,
                ),
              );
            },
          ),
        ));
  }
}
