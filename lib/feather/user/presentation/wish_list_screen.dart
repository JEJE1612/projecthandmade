import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/user/management/bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/prodect/products_card.dart';

import 'widget/custom_app_bar.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = MyBloc.get(context);
          return Scaffold(
              appBar: customAppBar("All Products", false, context),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  itemCount: bloc.product.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, int index) {
                    return FittedBox(
                      child: ProductsCard(
                        isShowDeleteButton: true, 
                        image: bloc.product[index]['prodectImage'],
                        price: bloc.product[index]['text'],
                        name: bloc.product[index]['price'],
                       id: bloc.product[index]['uid'], catgname: '', descreption: '', paces: '',
                      ),
                    );
                  },
                ),
              ));
        });
  }
}
