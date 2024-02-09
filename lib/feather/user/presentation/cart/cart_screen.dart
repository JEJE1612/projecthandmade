import 'package:flutter/material.dart';

import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/user/presentation/cart/cart_screen_list_tile_card.dart';
import 'package:handmade/feather/user/presentation/widget/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override

  //final CartListModel data = CartListModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Cart", false),
      body:   Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:4,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CartListTileCard(
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                        ),
                        color: primary.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Total Price",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "totalPrice",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Check Out",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                
              
            )
           /*Center(
              child: Text(
                "Cart is empty, please add some products",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontStyle: FontStyle.italic, color: Colors.purpleAccent),
              ),
            ),*/
    );
  }
}
