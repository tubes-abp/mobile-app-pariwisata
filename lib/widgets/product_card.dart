import 'package:wesata_mobile/helpers/currency_format.dart';
import 'package:wesata_mobile/models/product.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 110,
              height: 90,
              child: Image.network(
                "https://api-abp.bagas3.my.id/storage/${product.imageUrl}",
                width: 110,
                height: 90,
                fit: BoxFit.cover,
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
                  product.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text.rich(TextSpan(
                  text: CurrencyFormat.convertToIdr(product.price, 2),
                  style: blueTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ' /pcs',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
