import 'package:flutter/material.dart';

import 'package:handmade/feather/user/presentation/widget/app_bar_icons.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_card.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_screen_search_bar.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_slider.dart';
import 'package:handmade/feather/user/presentation/prodect/products_card.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/shimmer_progress.dart';
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
              const SizedBox(
                height: 200,
                child: Center(
                  child: ShimmerProgressForCarouselSlider(),
                ),
              ),
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
                title: "All Prodects",
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
        height: 90,
        child: ListView.builder(
          itemCount: 5, //categoriesController.categoryModel.data?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return const CategoriesCard();
          },
        ));
  }

  homeScreenAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          //SvgPicture.asset(ImagesUtils.craftyBayNavBarLogoSVG),
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
            icon: Icons.chat,
            onTap: () {},
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIcons(
            icon: Icons.logout_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
