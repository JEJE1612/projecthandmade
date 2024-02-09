import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/bloc_catg.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';

import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

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
            return const Center(
              child: Text(
                "Pleas add Catgroies",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          }
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: CustomAppBar(
                text: "show",
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
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                model.catoiesImage ?? "",
                errorListener: (p0) => Text("Not found"),
              ),
              radius: 45,
            ),
            Text(
              model.text ?? "",
              style: TextStyle(
                fontSize: 18,
                color: textBlack,
              ),
            ),
          ]),
    );
  }
}
