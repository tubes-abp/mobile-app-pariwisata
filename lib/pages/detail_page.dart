import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wesata_mobile/models/product.dart';
import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/pages/error_page.dart';
import 'package:wesata_mobile/pages/list_product_page.dart';
import 'package:wesata_mobile/providers/shop_provider.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/product_card.dart';
import 'package:wesata_mobile/widgets/rating_item.dart';

class DetailPage extends StatelessWidget {
  final Shop shop;
  const DetailPage(this.shop, {super.key});

  @override
  Widget build(BuildContext context) {
    var shopProvider = Provider.of<ShopProvider>(context);

    launchTelepon(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        launchUrl(Uri.parse(url));
      } else {
        // throw 'couldnt open telepon';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Image.network(
            'https://res.cloudinary.com/bagastri07/image/upload/v1655130980/shopWesataIcon/kayak_hipsbf.png',
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
                                shop.name.toString(),
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
                            '${shop.address!.street.toString()}\n${shop.address!.district}',
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
                      FutureBuilder(
                        future: shopProvider.getProductListByShopID(shop.id!),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Product>> snapshot) {
                          if (snapshot.hasData) {
                            List<Product> data = snapshot.requireData;

                            return Column(
                              children: data.asMap().entries.map((entry) {
                                int idx = entry.key;
                                Product item = entry.value;
                                return Container(
                                  child: idx < 4 ? ProductCard(item) : null,
                                );
                              }).toList(),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListProductPage(shop),
                              ),
                            );
                          },
                          child: const Text(
                            'See More',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            launchTelepon('tel:${shop.phoneNumber}');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: blueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                          ),
                          child: Text(
                            'Reservation Now',
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
