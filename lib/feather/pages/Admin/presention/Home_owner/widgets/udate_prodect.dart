import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/udate_prodect/udate_prodect.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/udate_prodect/udate_prodect_sate.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/custom_button_owner.dart';
import 'package:handmade/feather/pages/Admin/presention/Order/order_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class UdateProdectPage extends StatelessWidget {
  const UdateProdectPage({
    super.key,
    required this.model,
  });
  final ProdectModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UdateProdectBloc(),
      child: BlocConsumer<UdateProdectBloc, UdateProdetState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  const CustomAppBarOwner(text: "Udate_prodect "),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(15),
                        CustomTextFormFaild(
                          controll: UdateProdectBloc.get(context).title,
                          head: "Title:",
                          hintText: model.prodectname ?? "",
                          keyboardType: TextInputType.text,
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Gap(10),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: textFieldBg,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  maxLines: 3,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field cant Empty";
                                    }
                                    return '';
                                  },
                                  controller:
                                      UdateProdectBloc.get(context).descipton,
                                  cursorColor: textBlack,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          model.text ?? "Enter Descriotion"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        CustomTextFormFaild(
                          controll: UdateProdectBloc.get(context).paces,
                          head: "paces:",
                          hintText: model.pace ?? "",
                          keyboardType: TextInputType.number,
                        ),
                        const Gap(10),
                        CustomTextFormFaild(
                          controll: UdateProdectBloc.get(context).price,
                          head: "Price:",
                          hintText: model.price ?? "",
                          keyboardType: TextInputType.number,
                        ),
                        const Gap(15),
                        const Gap(30),
                        CustomButtonOwner(
                          title: "Udate_prodect",
                          color: primary,
                          onPressed: () {
                            UdateProdectBloc.get(context).updateProdect(
                              prodectUid: model.prodectuid!,
                              catgname: model.catgname,
                              prodectImage: model.prodectImage,
                              titlefrom:model.prodectname!,
                              desciptionfrom:model.text!,
                              pricefrom:model.price!,
                              pacefrom:model.pace!

                            );
                          },
                        ),
                        const Gap(10),
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
          );
        },
      ),
    );
  }
}
