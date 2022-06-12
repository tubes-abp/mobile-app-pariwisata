import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/pages/list_page.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/bottom_navbar_item.dart';
import 'package:wesata_mobile/widgets/category_card.dart';
import 'package:wesata_mobile/widgets/shop_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                "Explore Now",
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
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Text(
                "Kategori tempat wisata",
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryCard(
                      'Product',
                      'assets/city1.png',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CategoryCard(
                      'Ticket',
                      'assets/city2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: RECOMMENDED
              Text(
                "Recommended Shop",
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
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
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListPage(),
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
              'assets/icon_home_active.png',
              true,
            ),
            BottomNavbarItem(
              '/list',
              'assets/icon_shopping.png',
              false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
