import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_state.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.model});
  final ProdectModel model;
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late ProdectModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model; // Initialize the model field in initState
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "PayPal ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Center(
            child: TextButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckout(
                    sandboxMode: true,
                    clientId:
                        "AdjmXjmFxItrE5ukhmRf8oznPd6mlUXlvPW2YUi9OftKdEmIOlRHtLHSuk6K5UJtWcztCLKzVbyBlvjV",
                    secretKey:
                        "EI7V8C0ivsjRFm8piBsTmydxyiX7iqU9RBv0NJtJV9uK3i58pNlqmbrgs1jpSBNfh_gjlwiVKBsf2Rmu",
                    returnURL: "success.snippetcoder.com",
                    cancelURL: "cancel.snippetcoder.com",
                    transactions: const [
                      {
                        "amount": {
                          "total": '70',
                          "currency": "USD",
                          "details": {
                            "subtotal": '70',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        "item_list": {
                          "items": [
                            {
                              "name": "Apple",
                              "quantity": 4,
                              "price": '5',
                              "currency": "USD"
                            },
                            {
                              "name": "Pineapple",
                              "quantity": 5,
                              "price": '10',
                              "currency": "USD"
                            }
                          ],

                          // shipping address is not required though
                          //   "shipping_address": {
                          //     "recipient_name": "Raman Singh",
                          //     "line1": "Delhi",
                          //     "line2": "",
                          //     "city": "Delhi",
                          //     "country_code": "IN",
                          //     "postal_code": "11001",
                          //     "phone": "+00000000",
                          //     "state": "Texas"
                          //  },
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                      String productid = widget.model.prodectuid ?? "";
                      String price = widget.model.price ?? "";
                      String ownerUid = widget.model.uid ?? "";
                      String productname = widget.model.prodectname ?? "";
                      String productimage = widget.model.prodectImage ?? "";
                      OrderCubit.get(context).creatOrders(
                          context: context,
                          productid: productid,
                          price: price,
                          ownerUid: ownerUid,
                          productname: productname,
                          productimage: productimage);
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                    },
                  ),
                ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                ),
              ),
              child: const Text('By_Now'),
            ),
          ),
        );
      },
    );
  }
}
