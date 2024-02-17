import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';

class InformationProdect extends StatelessWidget {
  const InformationProdect({
    super.key,
    required this.model,
  });
  final ProdectModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: leftMainPadding, right: rightMainPadding, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deatils:",
            style: Styles.textStyle20,
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                "Name:",
                style: Styles.textStyle18.copyWith(color: primary),
              ),
              Gap(10),
              Text(
                "${model?.prodectname}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle16,
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    color: grey,
                  ),
                  const Gap(5),
                  Text(
                    "${model?.date}",
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${model?.price}",
                    style: Styles.textStyle18.copyWith(color: primary),
                  ),
                  Gap(5),
                  const Icon(
                    Icons.attach_money,
                    color: secondary,
                  ),
                  Gap(5),
                ],
              ),
            ],
          ),
          const Gap(15),
          Row(
            children: [
              const Icon(
                Icons.category,
                color: grey,
              ),
              const Gap(5),
              Row(
                children: [
                  Text("${model?.pace}", style: Styles.textStyle18),
                  Gap(5),
                  Text("piece", style: Styles.textStyle16),
                ],
              ),
            ],
          ),
          const Gap(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline,
                color: grey,
              ),
              const Gap(5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "${model?.text}",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
