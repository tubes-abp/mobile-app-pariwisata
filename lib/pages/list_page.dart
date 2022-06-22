import 'package:provider/provider.dart';
import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/providers/shop_provider.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/bottom_navbar_item.dart';
import 'package:wesata_mobile/widgets/shop_card.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

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
                "List Shop",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Mencari tempat pariwisata yang seru",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: shopProvider.getShopList(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
                  if (snapshot.hasData) {
                    List<Shop> data = snapshot.requireData;

                    return Column(
                      children: data.map((Shop item) {
                        return ShopCard(item);
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
                height: 50 + edge,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavbarItem(
              '/home',
              'assets/icon_home.png',
              false,
            ),
            BottomNavbarItem(
              '/list',
              'assets/icon_shopping_active.png',
              true,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
