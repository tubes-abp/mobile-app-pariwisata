import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/bottom_navbar_item.dart';
import 'package:wesata_mobile/widgets/shop_card.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'Category',
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
              Column(
                children: [
                  ShopCard(Shop(
                    id: 1,
                    imageUrl: 'assets/space1.png',
                    name: 'Toko Agus',
                    district: 'Cimahi',
                    city: 'Bandung',
                  )),
                  ShopCard(Shop(
                    id: 1,
                    imageUrl: 'assets/space1.png',
                    name: 'Toko Agus',
                    district: 'Cimahi',
                    city: 'Bandung',
                  )),
                  ShopCard(Shop(
                    id: 1,
                    imageUrl: 'assets/space1.png',
                    name: 'Toko Agus',
                    district: 'Cimahi',
                    city: 'Bandung',
                  )),
                  ShopCard(Shop(
                    id: 1,
                    imageUrl: 'assets/space1.png',
                    name: 'Toko Agus',
                    district: 'Cimahi',
                    city: 'Bandung',
                  )),
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See More',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
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
