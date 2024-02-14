

import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/user/presentation/widget/custom_stepper.dart';
import 'package:handmade/feather/user/presentation/widget/custom_app_bar.dart';
import 'package:handmade/feather/user/presentation/widget/love_icon_button.dart';
import 'package:handmade/feather/user/presentation/prodect/products_carousel_slider.dart';

class ProductsDetailsScreeninGategory extends StatefulWidget {

  const ProductsDetailsScreeninGategory({super.key});

  @override
  State<ProductsDetailsScreeninGategory> createState() => _ProductsDetailsScreeninGategoryState();
}

class _ProductsDetailsScreeninGategoryState extends State<ProductsDetailsScreeninGategory> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Products Details", true,context),
      body:
           Column(
            children: [
              ProductsDetailsCarouselSlider(
                
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: productsDetails(),
                  ),
                ),
              ),
              cartBottomContainer(
                ),
            ],
          )
     );
        }
      
    
  }

  Column productsDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "productsDetails ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.7,
                ),
              ),
            ),
            CustomStepper(
              stepValue: 1,
              lowerLimit: 1,
              upperLimit: 20,
              value: 1,
              onChanged: (value) {},
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            // const Text(
            //   '4',
            //   style: TextStyle(
            //     fontSize: 15,
            //     overflow: TextOverflow.ellipsis,
            //     fontWeight: FontWeight.w500,
            //     color: Colors.blueGrey,
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     /*Get.to(
            //       () => ReviewsScreen(
            //         productsId: productsDetails.productId ?? 0,
            //       )
            //     );*/
            //   },
            //   child: const Text(
            //     "Review",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
              },
              child: const FavoriteLoveIconButton(),
            ),
          ],
        ),
        const Text(
          "Color",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const SizedBox(
          height: 16,
        ),
      /*  ProductsDetailsColorSelector(
            colors: colors,
            selectedColor: _selectedColorIndex,
            onSelected: (int index) {
              _selectedColorIndex = index;
            }),*/
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Sizes",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const SizedBox(
          height: 16,
        ),
       /* ProductsDetailsSizeSelector(
          sizes: productsDetails.size?.split(',') ?? [],
          onSelect: (int index) {
            _selectedSizeIndex = index;
          },
          initialSelected: 0,
        ),*/
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Description",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const Text(
      "gvjhdhjdshehjjkjklklkfvkhjfshoijlfljdljfljfjsljflsjfdljlfjsofshofhuiewfwfjwijpdkslcd;lajfiohsifgsjifnsdfpoifo9qudpoqkad;am;amfmfnfnnf",
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  
  Container cartBottomContainer(
      ) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color:primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '80',
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
                    onPressed: () async {
                     /* final results = await addToCartController.addToCart(
                          productsDetails.id!,
                          color[_selectedColorIndex].toString(),
                          size[_selectedSizeIndex].toString());

                      if (results) {
                        Get.snackbar("Success", "Add to cart success");
                        log(color[_selectedColorIndex]);
                        log(size[_selectedSizeIndex]);
                      }
                      //else if (AuthController.accessToken!.isEmpty) {
                      //   Get.defaultDialog(
                      //       title: "Login",
                      //       content: const Text(
                      //           "To confirm your order, you need to login first"),
                      //       onCancel: () {
                      //         Get.back();
                      //       },
                      //       onConfirm: () {
                      //         AuthController.clear();
                      //       });
                   */ },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 13),
                    ),
                  
              
              ),
            )
          ],
        ),
      ),
    );
  }

