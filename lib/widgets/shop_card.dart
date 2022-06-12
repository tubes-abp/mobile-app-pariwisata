import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/pages/detail_page.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;
  const ShopCard(this.shop, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: 120,
                height: 100,
                child: Stack(
                  children: [
                    Image.asset(
                      shop.imageUrl.toString(),
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            )),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              "2/5",
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${shop.district}, ${shop.city}',
                  style: greyTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
