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
            builder: (context) => DetailPage(shop),
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
                    Image.network(
                      shop.imageUrl.toString(),
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
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
                    '${shop.address?.district}, ${shop.address?.province}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
