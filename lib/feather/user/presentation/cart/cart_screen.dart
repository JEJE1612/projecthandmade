import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/orders/ordersbloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/orders/ordersstate.dart';

import 'package:handmade/feather/user/presentation/cart/cart_screen_list_tile_card.dart';
import 'package:handmade/feather/user/presentation/cart/payment.dart';
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
    return BlocProvider(
      create: (context) => OrderBloc()..getorders(),
      child: BlocConsumer<OrderBloc, OrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            
            return Scaffold(
                appBar: customAppBar("Cart", false, context),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: OrderBloc.get(context).ordershow.length,
                        itemBuilder: (context, int index) {
                         
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CartListTileCard(
                              image: OrderBloc.get(context).ordershow[index]
                                  ['image'],
                              name: OrderBloc.get(context).ordershow[index]
                                  ['title'],
                              price: OrderBloc.get(context).ordershow[index]
                                  ['price'],
                              index: index, 
                              
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
                                Text(
                                  "Total Price",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                 OrderBloc.get(context).texttotal,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => payment())));
                                },
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
          }),
    );
  }
}
