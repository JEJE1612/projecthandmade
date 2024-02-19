import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/widgets_user/cust_itmes_prodect_user.dart';

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
          separatorBuilder: (context, index) => const SizedBox(width: 2),
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
