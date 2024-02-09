import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:handmade/feather/user/presentation/wish_list_screen.dart';

class TitleHeaderAndSeeAllButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleHeaderAndSeeAllButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () {  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const 
            WishListScreen() ,
                  ));
          },
          child: const Text("See All"),
        ),
      ],
    );
  }
}
