import 'package:wesata_mobile/pages/home_page.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/splash_monas.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Find UMKM Lokal\nto Get Destination You Want',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kunjungi Tempat Lokal Pariwisaata untuk destinasi liburan anda',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 210,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: blueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(
                          "Explore Now",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
