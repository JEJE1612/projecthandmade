import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/reating_model.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/rating/mangment/cubit/rating_cubit.dart';

class EditRate extends StatelessWidget {
  const EditRate({super.key, required this.rate});
  final RatingModel rate;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'update',
          child: Row(
            children: [
              Icon(Icons.edit),
              SizedBox(width: 5),
              Text('Update'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'remove',
          child: Row(
            children: [
              Icon(Icons.delete),
              SizedBox(width: 5),
              Text('Remove'),
            ],
          ),
        ),
      ],
      onSelected: (value) async {
        // Handle selection here
        if (value == 'update') {
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) => Padding(
          //     padding: EdgeInsets.only(
          //         bottom: MediaQuery.viewInsetsOf(context).bottom),
          //     child: AddRatingView(

          //       onPressed: () async {
          //         if (BlocProvider.of<RatingCubit>(context)
          //             .ratingKey
          //             .currentState!
          //             .validate()) {
          //           await BlocProvider.of<RatingCubit>(context)
          //               .updateRate(rate);
          //         }
          //       },
          //       buttonName: "Edit",
          //     ),
          //   ),
          // );
        } else if (value == 'remove') {
          await BlocProvider.of<RatingCubit>(context)
              .deleteRate(documentId: rate.documentId);
        }
      },
    );
  }
}
