
import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';

class CategoriesCard extends StatelessWidget {
  
  const CategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network( "https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGF2YXRhcnxlbnwwfHwwfHx8MA%3D%3D" , height: 50,)
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
             "shopping",
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                color: primary,
                letterSpacing: 0.4),
          ),
        ],
      ),
    );
  }
}