import 'package:flutter/material.dart';

class RatingIcon extends StatelessWidget {
  const RatingIcon({super.key, required this.rateValue});
  final double rateValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_border_outlined,
          size: 14,
          color: rateValue >= 1 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          Icons.star_border_outlined,
          size: 14,
          color: rateValue >= 2 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          Icons.star_border_outlined,
          size: 14,
          color: rateValue >= 3 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          Icons.star_border_outlined,
          size: 14,
          color: rateValue >= 4 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          Icons.star_border_outlined,
          size: 14,
          color: rateValue == 5 ? Color(0xffFFDD4F) : null,
        ),
      ],
    );
  }
}
