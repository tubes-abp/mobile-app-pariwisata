import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  const CategoryCard(this.name, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        height: 150,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
