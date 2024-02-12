import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

class ShowAllUser extends StatelessWidget {
  static const String nameKey = "ShowAllUser";
  const ShowAllUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..initialize(),
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
                text: "Show User",
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CupertinoSearchTextField(
                  controller: context.read<UserBloc>().searchword,
                  onChanged: (query) {
                    context.read<UserBloc>().searchResultList();
                  },
                ),
              ),
              const Gap(10),
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is LoadedUserState) {
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
          child: Column(
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
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: textBlack,
                  ),
                ),
              ]),
        );
      },
    );
  }
}
