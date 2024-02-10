import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/user/management/bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/categoreys/productincategory/prodect/products_card.dart';

import 'package:handmade/feather/user/presentation/widget/custom_app_bar.dart';


class prodectcatgScreen extends StatefulWidget {
  const prodectcatgScreen({super.key});

  @override
  State<prodectcatgScreen> createState() => _prodectcatgScreenState();
}

class _prodectcatgScreenState extends State<prodectcatgScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = MyBloc.get(context);
          return Scaffold(
              appBar: customAppBar("All Products", false,context),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  itemCount: 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, int index) {
                    return const FittedBox(
                      child: ProductsCardCategory(
                        isShowDeleteButton: true,
                      ),
                    );
                  },
                ),
              ));
        });
  }
}
