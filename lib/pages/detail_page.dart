import 'package:wesata_mobile/models/product.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/product_card.dart';
import 'package:wesata_mobile/widgets/rating_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Image.asset(
            'assets/thumbnail.png',
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              const SizedBox(
                height: 328,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // NOTE: TITLE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Toko Agus',
                                style: blackTextStyle.copyWith(
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                            ],
                          ),
                          Row(
                            children: [1, 2, 3, 4, 5]
                                .map(
                                  (idx) => RatingItem(idx, 5),
                                )
                                .toList(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // NOTE: LOCATION
                      Text(
                        "Location",
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jl Peta Selatan\nBandung",
                            style: greyTextStyle,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // NOTE: LOCATION
                      Text(
                        "Catalog Product",
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          ProductCard(Product(
                            id: 1,
                            imageUrl: 'assets/space1.png',
                            name: 'Toko Agus',
                            price: 100000,
                          )),
                          ProductCard(Product(
                            id: 1,
                            imageUrl: 'assets/space1.png',
                            name: 'Toko Agus',
                            price: 100000,
                          )),
                          ProductCard(Product(
                            id: 1,
                            imageUrl: 'assets/space1.png',
                            name: 'Toko Agus',
                            price: 100000,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: blueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                          ),
                          child: Text(
                            'Rseservation Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge,
              vertical: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
