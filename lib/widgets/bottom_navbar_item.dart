import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String routeName;
  final String imageUrl;
  final bool isActive;

  const BottomNavbarItem(this.routeName, this.imageUrl, this.isActive,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            imageUrl,
            width: 26,
          ),
          const Spacer(),
          isActive
              ? Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(1000),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
