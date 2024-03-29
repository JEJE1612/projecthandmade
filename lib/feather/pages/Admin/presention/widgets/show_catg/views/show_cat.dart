import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/custom_loding.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/bloc_catg.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_state.dart';

import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/widgets_user/cust_itmes_prodect_user.dart';

class ShowCatgroies extends StatelessWidget {
  static const String nameKey = "ShowCatgroies";
  const ShowCatgroies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatgBloc()..getCats(),
      child: BlocBuilder<CatgBloc, CatgState>(
        builder: (context, state) {
          var model = CatgBloc.get(context).catroiesList;
          if (CatgBloc.get(context).catroiesList.isEmpty) {
            return const CustomLoding();
          }
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: CustomAppBar(
                text: "Categories",
              ),
            ),
            body: GridView.builder(
              padding: const EdgeInsets.only(
                  left: leftMainPadding, right: rightMainPadding),
              shrinkWrap: true,
              itemCount: model.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 0.999,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return CatroiesItems(
                  model: model[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CatroiesItems extends StatelessWidget {
  const CatroiesItems({
    super.key,
    required this.model,
  });
  final CatroiesModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowProdectCatroies(nameCat: model.text!),
            ));
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Match the value with the one used in BoxDecoration
                  child: CachedNetworkImage(
                    imageUrl: model.catoiesImage ?? "",
                    fit: BoxFit.cover,
                    height: 90,
                    width: 100,
                  ),
                ),
              ),
            ),
            Text(
              model.text ?? "",
              style: const TextStyle(
                fontSize: 18,
                color: textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowProdectCatroies extends StatelessWidget {
  const ShowProdectCatroies({super.key, required this.nameCat});
  final String nameCat;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProdectBloc()..getProdectCustomUser(catrgname: nameCat),
      child: BlocConsumer<ProdectBloc, ProdectState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          itemCount: ProdectBloc.get(context)
                              .prodectsCustomUser
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 2,
                            childAspectRatio: 1 / 1.0,
                          ),
                          itemBuilder: (context, index) => CardItemsProdectUser(
                                prodect: ProdectBloc.get(context)
                                    .prodectsCustomUser[index],
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
