import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/custom_loding.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/bloc_catg.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

class RemoveCatgroies extends StatelessWidget {
  static const String nameKey = "RemoveCatgroies";
  const RemoveCatgroies({
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
                text: "Remove Catgroies",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GridView.builder(
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 10,
          clipBehavior: Clip.none,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15.0), // Adjust the value as needed
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                      15.0), // Match the value with the one used in shape
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
                      width: MediaQuery.of(context).size.width * 0.32),
                ),
              ),
              Positioned(
                right: -15,
                top: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    onPressed: () {
                      CatgBloc.get(context).deleteCatroies(model.uid!);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          model.text ?? "",
          style: const TextStyle(
              fontSize: 18, color: textBlack, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
