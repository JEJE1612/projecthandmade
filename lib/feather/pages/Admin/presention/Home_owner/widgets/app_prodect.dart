import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_state.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/text_form_faild_discr.dart';
import 'package:handmade/feather/pages/Admin/presention/Order/order_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class AppProdect extends StatefulWidget {
  const AppProdect({
    super.key,
  });

  @override
  State<AppProdect> createState() => _AppProdectState();
}

class _AppProdectState extends State<AppProdect> {
  var selectedType;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdectBloc()..getCaroies(),
      child: BlocConsumer<ProdectBloc, ProdectState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = ProdectBloc.get(context);
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  const CustomAppBarOwner(text: "Add prodect "),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Column(
                      children: [
                        if (ProdectBloc.get(context).imageProdect == null)
                          InkWell(
                            onTap: () {
                              bloc.getimagecatrg();
                            },
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: textFieldBg,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "AddPhoto",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(
                                          Icons.camera_alt_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (ProdectBloc.get(context).imageProdect != null)
                          Stack(
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(bloc.imageProdect!),
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Positioned(
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    bloc.removeimagecatrg();
                                  },
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.close_rounded,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        const Gap(15),
                        CustomTextFormFaild(
                          controll: bloc.title,
                          head: "Title:",
                          hintText: "Name Prodect",
                          keyboardType: TextInputType.text,
                        ),
                        const Gap(10),
                        TxetFormDiscription(
                          discr: bloc.descipton,
                        ),
                        const Gap(10),
                        CustomTextFormFaild(
                          controll: bloc.paces,
                          head: "paces:",
                          hintText: "Numder paces",
                          keyboardType: TextInputType.number,
                        ),
                        const Gap(10),
                        CustomTextFormFaild(
                          controll: bloc.price,
                          head: "Price:",
                          hintText: "Numder Price",
                          keyboardType: TextInputType.number,
                        ),
                        const Gap(10),
                        Container(
                          width: double.infinity,
                          color: textFieldBg,
                          child: DropdownButton(
                            items: bloc.catroies.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  '${value['text']}',
                                  style: const TextStyle(color: textBlack),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedAccountType) {
                              print('$selectedAccountType');
                              setState(() {
                                selectedType = selectedAccountType;
                              });
                            },
                            value: selectedType,
                            isExpanded: true,
                            hint: const Text('Choose Your Category',
                                style: TextStyle(color: textBlack)),
                          ),
                        ),
                        const Gap(30),
                        InkWell(
                          onTap: () {
                            ProdectBloc.get(context).uploadimageProdect();
                          },
                          child: const CustomButtonAuth(
                            text: " Creat Prodect ",
                          ),
                        ),
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
