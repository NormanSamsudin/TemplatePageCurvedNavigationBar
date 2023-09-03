import 'package:example_curved_navigation_bar_page/config/colors.dart';
import 'package:example_curved_navigation_bar_page/pages/page1.dart';
import 'package:example_curved_navigation_bar_page/pages/page2.dart';
import 'package:example_curved_navigation_bar_page/pages/page3.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Widget showPage = page2();// initial page

  // list of pages
  List<Widget> pageList = [
    page1(),
    page2(),
    page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        // appbar
        appBar: AppBar(
            backgroundColor: hijauCair,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.travel_explore_rounded),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Curved Navigation Bar",
                  style: TextStyle(color: hitam),
                )
              ],
            )),

        //body content will be changed once bottom navigation bar clicked
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Container(
            height: double.infinity,
            child: Center(
              child: showPage,
            ),
            ),
        ) ,
        
        //
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: putihPeach,
          buttonBackgroundColor: putihPeach,
          backgroundColor: putih,

          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              showPage = pageList[index];
            });
          },

          // detail icon dalam navigation bar
          items: const [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.qr_code,
                size: 28,
              ),
              label: 'Scanner',
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home_outlined,
                size: 28,
              ),
              label: 'Dashboard',
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 28,
              ),
              label: 'Shop',
            ),
          ],
        ),
      ),
    );
  }
}
