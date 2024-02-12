import 'package:flutter/material.dart';

import 'package:handmade/cors/theme/colors.dart';

import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/app_bar_owner.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/app_prodect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/custom_card_owner_creat.dart';

class HomeOwnerpage extends StatelessWidget {
  const HomeOwnerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AppProdect(),
              ));
        },
        child: const Text("ADD"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOwner(),
            Expanded(
              child: Container(
                color: light,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => const CustomCardOwnerCreat(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
