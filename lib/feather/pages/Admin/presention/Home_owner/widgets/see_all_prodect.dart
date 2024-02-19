import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/widgets_user/cust_itmes_prodect_user.dart';

class SeePallProdect extends StatelessWidget {
  const SeePallProdect({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdectBloc()..getProdect(),
      child: BlocConsumer<ProdectBloc, ProdectState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: textWhite,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: const Center(
                      child: Text(
                        "All_Prodect",
                        style: TextStyle(
                            fontSize: 18,
                            color: textBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      color: light,
                      child: GridView.builder(
                          itemCount: ProdectBloc.get(context).prodects.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 2,
                            childAspectRatio: 1 / 1.0,
                          ),
                          itemBuilder: (context, index) => CardItemsProdectUser(
                                prodect:
                                    ProdectBloc.get(context).prodects[index],
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
