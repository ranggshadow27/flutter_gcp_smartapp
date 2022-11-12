// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_animation/main.dart';
import 'package:flutter_auth_animation/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: Container(
          height: maxHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                blueColor,
                greenColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBar(),
                      SizedBox(
                        height: 42,
                      ),
                      Text(
                        "Hi. Pak GO!",
                        style: interSemibold.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Welcome to GCP Dashboard",
                        style: interLight.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Row(
                        children: [
                          Text(
                            "MENU",
                            style: interSemibold.copyWith(
                                fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MenuIcon(
                              menuicon: Boxicons.bx_book, menutitle: "Laporan"),
                          MenuIcon(
                              menuicon: Boxicons.bx_notepad,
                              menutitle: "Informasi"),
                          MenuIcon(
                              menuicon: Boxicons.bx_sitemap,
                              menutitle: "Struktur"),
                          MenuIcon(
                              menuicon: Boxicons.bx_calendar_event,
                              menutitle: "Event"),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: maxWidth,
                  // height: maxHeight * 0.8,
                  color: whiteColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 30,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "MENU",
                              style: interSemibold.copyWith(
                                  fontSize: 16, color: greenColor),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              DateTime.now().day.toString() +
                                  "/" +
                                  DateTime.now().month.toString() +
                                  "/" +
                                  DateTime.now().year.toString(),
                              style: interSemibold.copyWith(
                                  fontSize: 16, color: greenColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 42),
                        CardMenu(
                          maxWidth: maxWidth,
                          title: "120 Total Warga",
                          subtitle: "Jumlah Warga",
                          iconBgColor: iconBg1,
                          iconMenu: Boxicons.bx_group,
                        ),
                        SizedBox(height: 15),
                        CardMenu(
                          maxWidth: maxWidth,
                          title: "Rp. 600.000",
                          subtitle: "Keuangan GCP",
                          iconBgColor: iconBg2,
                          iconMenu: Boxicons.bxs_dollar_circle,
                        ),
                        SizedBox(height: 15),
                        CardMenu(
                          maxWidth: maxWidth,
                          title: "Rp. 700.000",
                          subtitle: "Keuangan DKM",
                          iconBgColor: iconBg3,
                          iconMenu: Boxicons.bx_wallet,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          alignment: Alignment(-4, 0),
          splashRadius: 1,
          icon: Icon(
            Boxicons.bx_menu_alt_left,
            size: 25,
            color: whiteColor,
          ),
        ),
        Text(
          "Dashboard",
          style: interMedium.copyWith(
            color: whiteColor,
            fontSize: 16,
          ),
        ),
        Container(
          height: 40,
          width: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/login');
            },
            child: Icon(
              Boxicons.bx_log_in_circle,
              size: 20,
              color: blueColor,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF6D6D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({
    Key? key,
    required this.maxWidth,
    required this.iconBgColor,
    required this.iconMenu,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final double maxWidth;
  final IconData iconMenu;
  final Color iconBgColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: maxWidth,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightwhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadowColor: Colors.black26,
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(iconMenu, size: 35, color: whiteColor),
              ),
              // SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    title,
                    style:
                        interSemibold.copyWith(fontSize: 16, color: blueColor),
                  ),
                  Text(
                    subtitle,
                    style: interLight.copyWith(fontSize: 16, color: blueColor),
                  ),
                ],
              ),
              Image.asset('assets/next.png', width: 30),
            ],
          ),
        ));
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    Key? key,
    required this.menutitle,
    required this.menuicon,
  }) : super(key: key);

  final String menutitle;
  final IconData menuicon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(
              menuicon,
              color: blueColor,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          menutitle,
          style: interMedium.copyWith(
            color: whiteColor,
          ),
        ),
      ],
    );
  }
}
