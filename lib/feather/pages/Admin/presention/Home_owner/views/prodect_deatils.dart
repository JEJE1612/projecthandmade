import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/back_ground_prodect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/information_prdect.dart';

import '../../../mangment/prodect/prodect_state.dart';

class ProdectDeatils extends StatelessWidget {
  const ProdectDeatils({super.key, required this.prodect});
  final ProdectModel? prodect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: BlocListener<ProdectBloc, ProdectState>(
        listener: (context, state) {
          if (state is SuccessDeleteProect) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackGroundBrodect(
                  image: prodect?.prodectImage ?? "",
                ),
                InformationProdect(
                  model: prodect,
                ),
                const Gap(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    children: [
                      Text(
                        "comment",
                        style: Styles.textStyle20,
                      ),
                      const Gap(5),
                      const Gap(10),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) =>
                              const CardItemsComment(),
                        ),
                      ),
                      const Gap(20),
                      CustomButtonOwner(
                        title: "Comment",
                        color: primary,
                        onPressed: () {},
                      ),
                      if (UserBloc.get(context).usermodel?.type != 'Owner')
                        CustomButtonOwner(
                          title: "Buy_it",
                          color: secondary,
                          onPressed: () {},
                        ),
                      CustomButtonOwner(
                        title: "Remove_it",
                        color: danger,
                        onPressed: () {
                          ProdectBloc.get(context)
                              .deleteProdect(prodect!.prodectuid!);
                        },
                      ),
                      CustomButtonOwner(
                        title: "update_it",
                        color: textBlack,
                        onPressed: () {},
                      ),
                      const Divider(
                        indent: 60,
                        color: primary,
                        endIndent: 60,
                        height: 2,
                        thickness: 2,
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardItemsComment extends StatelessWidget {
  const CardItemsComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                        backgroundColor: Colors.amber, radius: 25),
                    Gap(10),
                    Column(
                      children: [
                        Text(
                          "Ahmed Mohmed",
                          style: Styles.textStyle16,
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButtonOwner extends StatelessWidget {
  const CustomButtonOwner({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
  });
  final Function()? onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: textWhite,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
