import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/Admin/data/model/reating_model.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/rating/widget/rate_item.dart';

class RatingView extends StatelessWidget {
  final List<RatingModel> allRating;

  const RatingView({super.key, required this.allRating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: allRating.length,
        itemBuilder: (context, index) => RateItem(
          rate: allRating[index],
        ),
      ),
    );
  }
}
