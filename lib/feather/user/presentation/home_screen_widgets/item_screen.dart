import 'package:flutter/material.dart';
import 'package:handmade/feather/user/presentation/widget/custom_app_bar.dart';
import 'package:handmade/feather/user/presentation/wish_list_screen.dart';

class ItemsScreen extends StatefulWidget {
  final String title;
//  final Product products;

  const ItemsScreen(
      {Key? key,
      required this.title,
      //required this.products
      })
      : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title, true,context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount:5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, int index) {
            return
               const WishListScreen();
                
              
            
          },
        ),
      ),
    );
  }
}
