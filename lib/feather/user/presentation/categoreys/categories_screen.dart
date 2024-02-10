import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/user/management/bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_card.dart';
import 'package:handmade/feather/user/presentation/widget/custom_app_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = MyBloc.get(context);
          return Scaffold(
            appBar: customAppBar("Categories", false,context),
            body: gridViewForCategories,
          );
        });
  }

  Padding get gridViewForCategories {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: MyBloc.get(context).catroies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, int index) {
          return  FittedBox(
            child: CategoriesCard(name:MyBloc.get(context).catroies[index]['text'],
             image: MyBloc.get(context).catroies[index]['catoiesImage'],),
          );
        },
      ),
    );
  }
}
