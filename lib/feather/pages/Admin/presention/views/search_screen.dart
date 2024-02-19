import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/search_prodect/mangment/seach_prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/search_prodect/mangment/seach_prodect_state.dart.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchProdetCubit()..initialize(),
      child: const SearchAllProdectViewitems(),
    );
  }
}

class SearchAllProdectViewitems extends StatelessWidget {
  const SearchAllProdectViewitems({super.key});

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
              Container(
                color: textWhite,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: const Center(
                  child: Text(
                    "Search_Prodect",
                    style: TextStyle(
                        fontSize: 18,
                        color: textBlack,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CupertinoSearchTextField(
                  controller: context.read<SearchProdetCubit>().searchword,
                  onChanged: (query) {
                    context.read<SearchProdetCubit>().searchResultList();
                  },
                ),
              ),
              const Gap(10),
              Expanded(
                child: BlocBuilder<SearchProdetCubit, SearchProdetState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      EasyLoading.show();
                    } else if (state is LoadedState) {
                      EasyLoading.dismiss();
                      return SearchItem(
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

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.resultlist});
  final List resultlist;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: resultlist.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.16,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            resultlist[index]['prodectImage'],
                          ))),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: Styles.textStyle16.copyWith(color: primary),
                        ),
                        Row(
                          children: [
                            Text(
                              resultlist[index]['prodectname'],
                              style: Styles.textStyle18,
                            ),
                          ],
                        ),
                        Gap(10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Price:"),
                                  Gap(20),
                                  Text(
                                    resultlist[index]['price'],
                                    style: Styles.textStyle16
                                        .copyWith(color: primary),
                                  ),
                                  const Icon(
                                    Icons.attach_money,
                                    color: secondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
