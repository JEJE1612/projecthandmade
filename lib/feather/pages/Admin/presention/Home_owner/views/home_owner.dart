import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';

import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_state.dart';

import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/app_bar_owner.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/app_prodect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/custom_card_owner_creat.dart';

class HomeOwnerpage extends StatelessWidget {
  const HomeOwnerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdectBloc()..getProdectCustomOwner(),
      child: BlocConsumer<ProdectBloc, ProdectState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GridView.builder(
                          itemCount: ProdectBloc.get(context)
                              .prodectsCustomOwner
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 2,
                            childAspectRatio: 1 / 1.0,
                          ),
                          itemBuilder: (context, index) => CustomCardOwnerCreat(
                                model: ProdectBloc.get(context)
                                    .prodectsCustomOwner[index],
                              )),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
