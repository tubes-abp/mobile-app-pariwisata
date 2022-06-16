import 'package:provider/provider.dart';
import 'package:wesata_mobile/models/product.dart';
import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/providers/shop_provider.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/product_card.dart';

class ListProductPage extends StatelessWidget {
  final Shop shop;
  const ListProductPage(this.shop, {super.key});

  @override
  Widget build(BuildContext context) {
    var shopProvider = Provider.of<ShopProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: edge, left: edge, bottom: edge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: TITLE/HEADER
              Text(
                "List Product Shop",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Categories:",
                    style: blackTextStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                      ),
                      child: Text(
                        'Product',
                        style: blueTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                      ),
                      child: Text(
                        'Ticket',
                        style: whiteTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      children: data.map((Product item) {
                        return Container(
                          child: ProductCard(item),
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
              SizedBox(
                height: edge,
              ),
              SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: blueColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                  ),
                  label: Text(
                    'Back',
                    style: blueTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
