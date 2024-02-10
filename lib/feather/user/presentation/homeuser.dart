import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/user/management/bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/favourte/productincategory/favorateprotect.dart';

import 'package:handmade/feather/user/presentation/widget/app_bar_icons.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_card.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_screen_search_bar.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_slider.dart';
import 'package:handmade/feather/user/presentation/prodect/products_card.dart';
import 'package:handmade/feather/user/presentation/widget/titecategories.dart';
import 'package:handmade/feather/user/presentation/widget/title_header_and_see_all_button.dart';
import 'package:handmade/feather/user/presentation/profile/profile.dart';

class HomeScreenUser extends StatefulWidget {
  const HomeScreenUser({super.key});

  @override
  State<HomeScreenUser> createState() => _HomeScreenUserState();
}

class _HomeScreenUserState extends State<HomeScreenUser> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = MyBloc.get(context);
          return Scaffold(
            appBar: homeScreenAppBar(context),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const HomeScreenSearchBar(),
                    const SizedBox(
                      height: 16,
                    ),
                    // const SizedBox(
                    //   height: 200,
                    //   child: Center(
                    //     child: ShimmerProgressForCarouselSlider(),
                    //   ),
                    // ),
                    HomeSlider(),
                    const SizedBox(
                      height: 16,
                    ),
                    TitleHeaderAndSeeAllButtonforcategory(
                      title: 'All Categories',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    allCategoriesCardListView,
                    TitleHeaderAndSeeAllButton(
                      title: "All Products",
                      onTap: () {
                        //Get.to(
                        //const ItemsScreen(
                        //title: '',
                        //),
                        //);
                      },
                    ),
                    popularItemsListView,
                  ],
                ),
              ),
            ),
          );
        });
  }

  SizedBox get popularItemsListView {
    return SizedBox(
      height: 182,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ProductsCard(
            isShowDeleteButton: false,
          );
        },
      ),
    );
  }

  SizedBox get allCategoriesCardListView {
    return SizedBox(
        height: 130,
        child: ListView.builder(
          itemCount: MyBloc.get(context)
              .catroies
              .length, //categoriesController.categoryModel.data?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return CategoriesCard(
              name: MyBloc.get(context).catroies[index]['text'],
              image: MyBloc.get(context).catroies[index]['catoiesImage'],
            );
          },
        ));
  }

  homeScreenAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          const Text("HandMade", style: TextStyle(color: primary)),
          const Spacer(),
          AppBarIcons(
            icon: Icons.person_outline,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  ));
            },
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIcons(
            icon: Icons.favorite_border,
            onTap: () {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const FavourateprodectScreen()));
            },
          ),
        ],
      ),
    );
  }
}
