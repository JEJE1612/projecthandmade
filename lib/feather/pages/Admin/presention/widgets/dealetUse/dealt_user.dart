import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/dealetUse/mangment/dealt_all_user_cubit.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/dealetUse/mangment/dealt_all_user_state.dart.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

import '../../../../../../cors/theme/padding.dart';

class DealtAllUser extends StatelessWidget {
  const DealtAllUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DealtAllUserCubit()..initialize(),
      child: const DealtAllUserViewitems(),
    );
  }
}

class DealtAllUserViewitems extends StatelessWidget {
  const DealtAllUserViewitems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: topMainPadding,
              left: leftMainPadding,
              right: rightMainPadding),
          child: Column(
            children: [
              const CustomAppBar(
                text: "remove user",
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CupertinoSearchTextField(
                  controller: context.read<DealtAllUserCubit>().searchword,
                  onChanged: (query) {
                    context.read<DealtAllUserCubit>().searchResultList();
                  },
                ),
              ),
              const Gap(10),
              Expanded(
                child: BlocBuilder<DealtAllUserCubit, DealtAllUserState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      EasyLoading.show();
                    } else if (state is LoadedState) {
                      EasyLoading.dismiss();
                      return DealtItem(
                        resultlist: state.resultlist,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DealtItem extends StatelessWidget {
  const DealtItem({super.key, required this.resultlist});
  final List resultlist;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:
          const EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
      shrinkWrap: true,
      itemCount: resultlist.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Stack(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        resultlist[index]['image'],
                      ),
                      radius: 40,
                    ),
                    Text(
                      resultlist[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: textBlack,
                      ),
                    ),
                  ]),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(resultlist[index]['uid'])
                          .delete()
                          .then((_) {});
                      EasyLoading.showSuccess(" Remove Success ");
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
        );
      },
    );
  }
}
