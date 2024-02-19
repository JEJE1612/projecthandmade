import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';

import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/see_all_prodect.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/show_cat.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/widgets_user/list_prodect.dart';
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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeePallProdect(),
                ));
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
              child: const ListProdect()),
        ),
        Gap(10),
        const Divider(
          indent: 60,
          color: primary,
          endIndent: 60,
          height: 2,
          thickness: 2,
        ),
        Gap(10),
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
