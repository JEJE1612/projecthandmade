import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/orders/ordersbloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/orders/ordersstate.dart';

import 'package:handmade/feather/user/presentation/widget/custom_stepper.dart';

class CartListTileCard extends StatelessWidget {
  // final CartData cartData;
  String name;
  String image;
  String price;
  int index;

  CartListTileCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.index,

    // required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrdersState>(listener: (context, state) {
      if (state is ScafullGetordersstate) {
        int price = int.parse(OrderBloc.get(context).ordershow[index]['price']);
        OrderBloc.get(context).findtotal(price);
      }
    }, builder: (context, state) {
      String orderuid = OrderBloc.get(context).ordershow[index]['orderuid'];
      // String productid= OrderBloc.get(context).ordershow[index]['productid'];

      return Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(image),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              OrderBloc.get(context).deleteOrders(orderuid);
                              //    bool delete = await deleteController.deleteCartId(cartData.productId!);
                              /*  if(delete){
                                  Get.snackbar("success", "products deleted successfully");
                                }else{
                                  Get.snackbar("failed", "products delete failed");
                                }*/
                            },
                            icon: const Icon(Icons.delete_outline))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              color: primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        // SizedBox(
                        //   width: 85,
                        // //   child: FittedBox(
                        //     child: CustomStepper(
                        //       lowerLimit: 1,
                        //       upperLimit: 20,
                        //       stepValue: 1,
                        //       value: 1,
                        //       onChanged: (int value) {

                        //         // OrderBloc.get(context).choosehowmanypace(
                        //         //     value.toString(),
                        //         //   orderuid,
                        //         //     image,
                        //         //     price,
                        //         //     productid,
                        //         //     name
                        //         //     );
                        //       },
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
