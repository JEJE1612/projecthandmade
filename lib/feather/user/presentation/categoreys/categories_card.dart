import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/user/presentation/categoreys/productincategory/protectcatg.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const prodectcatgScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  image,
                  height: 50,
                )),
            const SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  color: primary,
                  letterSpacing: 0.4),
            ),
          ],
        ),
      ),
    );
  }
}
