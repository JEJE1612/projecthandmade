import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';

import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

class ShowUser extends StatelessWidget {
  static const String nameKey = "ShowCatgroies";
  const ShowUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(
          text: "ShowUser",
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
            left: leftMainPadding, right: rightMainPadding),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 0.999,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 45,
                  ),
                  Text(
                    "name User",
                    style: TextStyle(
                      fontSize: 18,
                      color: textBlack,
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
