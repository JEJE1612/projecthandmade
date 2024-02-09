import 'package:flutter/material.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_screen.dart';

class TitleHeaderAndSeeAllButtonforcategory extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleHeaderAndSeeAllButtonforcategory({
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
            CategoriesScreen() ,
                  ));
          },
          child: const Text("See All"),
        ),
      ],
    );
  }
}
