import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/fevorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

//the class that contains a buttom nav bar must be stateful

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  //كل ما تتغير قيمة هذا المتغير, يتغير العنصر المختار في البار
  int selectedItemIndex = 0;

  //this function is called when any of the bottom navbar items is clicked
  void onItemTapped(int index) {
    //use setState عشان يصير تغيير لحظي
    setState(() {
      selectedItemIndex = index;
    });
  }

  //this list contains the pages that we will navigate through the bottom navbar
  //the pages must be in the same order as the items in the bottom navbar (ex the HomePage
  //is the first page here, and the home icon is the first icon in the bottom navbar)
  List<Widget> widgetBuilder = const [
    HomePage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        backgroundColor: Colors.grey[100],

        //the body will change to show the selected page from the bottom navbar
        body: widgetBuilder[selectedItemIndex],
        bottomNavigationBar: adaptiveBottomNavbar(size, orientation));
  }

  Widget? adaptiveBottomNavbar(Size size, Orientation orientation) {
    //dont show buttom navbar in pc
    if (size.width > 800 && orientation != Orientation.landscape) {
      return null;
    } else if (Platform.isIOS) {
      return CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedItemIndex,
        onTap: onItemTapped,
      );
    } else {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedItemIndex,
        onTap: onItemTapped,
      );
    }
  }
}
