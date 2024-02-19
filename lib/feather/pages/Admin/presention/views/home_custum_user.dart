import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_state.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/views/prodect_deatils.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/show_cat.dart';
import 'package:handmade/feather/user/management/bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_card.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_slider.dart';
import 'package:handmade/feather/user/presentation/widget/title_head.dart';
import 'package:handmade/feather/user/views/home_user.dart';

class HomeCustomUser extends StatelessWidget {
  const HomeCustomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const CustomAppBarUser(),
        const Gap(10),
        const CustomSearch(),
        const Gap(10),
        HomeSlider(),
        const SizedBox(
          height: 16,
        ),
        TitleHeaderAndSeeAllButton(
          title: 'Categories',
          onTap: () {
            Navigator.pushNamed(context, ShowCatgroies.nameKey);
          },
        ),
        allCategoriesCardListView,
        TitleHeaderAndSeeAllButton(
          title: "Products",
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
              child: const ListProdect()),
        ),
        Gap(20),
      ]),
    );
  }

  SizedBox get allCategoriesCardListView {
    return SizedBox(
        height: 130,
        child: BlocBuilder<MyBloc, MyState>(
          builder: (context, state) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const SizedBox(
                width: 3,
              ),
              itemCount: MyBloc.get(context).catroies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return CategoriesCard(
                  name: MyBloc.get(context).catroies[index]['text'],
                  image: MyBloc.get(context).catroies[index]['catoiesImage'],
                );
              },
            );
          },
        ));
  }
}

class ListProdect extends StatelessWidget {
  const ListProdect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProdectBloc, ProdectState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 2),
          scrollDirection: Axis.horizontal,
          itemCount: ProdectBloc.get(context).prodects.length,
          itemBuilder: (context, index) {
            return CardItemsProdectUser(
              prodect: ProdectBloc.get(context).prodects[index],
            );
          },
        );
      },
    );
  }
}

class CardItemsProdectUser extends StatelessWidget {
  const CardItemsProdectUser({
    super.key,
    required this.prodect,
  });
  final ProdectModel prodect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProdectDeatils(
                prodect: prodect,
              ),
            ));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      prodect.prodectImage ?? "",
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              prodect.price ?? "",
                              style:
                                  Styles.textStyle16.copyWith(color: primary),
                            ),
                            const Icon(
                              Icons.attach_money,
                              color: secondary,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                  Text(
                    prodect.prodectname ?? "",
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
