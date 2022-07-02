import 'package:flutter/material.dart';
import 'package:wallpaper_application/component/component.dart';
import 'package:wallpaper_application/screen/favorite/favorite_screen.dart';
import 'package:wallpaper_application/screen/person/person_screen.dart';
import '../screen/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    PersonScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined, color: Colors.black26),
                label: "",
                activeIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.white),
                      //offset:Offset(0,4),
                    ],
                  ),
                  child: const Icon(Icons.home),
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border_outlined,
                    color: Colors.black26),
                label: "",
                activeIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.white),
                      //offset:Offset(0,4),
                    ],
                  ),
                  child: const Icon(Icons.favorite),
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline, color: Colors.black26),
                label: "",
                activeIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.white),
                      //offset:Offset(0,4),
                    ],
                  ),
                  child: const Icon(Icons.person),
                )),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
