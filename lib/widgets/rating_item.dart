import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  const RatingItem(this.index, this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon_star.png',
      width: 20,
      color: index > rating ? const Color(0xff989BA1) : null,
    );
  }
}
