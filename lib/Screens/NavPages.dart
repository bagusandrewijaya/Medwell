import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:medwell/Components/Pallete.dart';
import 'package:medwell/Screens/LandingPage.dart';
import 'package:medwell/Screens/LoginScreen.dart';
import 'package:medwell/Screens/finalLog.dart';

class NavPages extends StatefulWidget {
  const NavPages({Key? key}) : super(key: key);

  @override
  State<NavPages> createState() => _NavPagesState();
}

class _NavPagesState extends State<NavPages> {
  // List of pages to be displayed in the Bottom Nav Bar
  List pages = [
    LandingPage(), // Index 0
    const LoginScreen(), // Index 1
    LandingPage(), // Index 2
    const finalLog(), // Index 3
  ];

  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const finalLog()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Pallete.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF000000), // Start color
              const Color(0xFF333333), // Middle color
              const Color(0xFF666666), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(

          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Pallete.primary,
          unselectedItemColor: Colors.black26,
          type: BottomNavigationBarType.fixed,


          items: [
            // Bottom Nav Items, icons, and styles
            const BottomNavigationBarItem(
              label: "Home",
              icon: Icon(FluentSystemIcons.ic_fluent_apps_add_in_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_apps_add_in_filled),
            ),
            BottomNavigationBarItem(
              label: "Calendar",
              icon: Image.asset(
                'assets/images/calendarLogo.png',
                width: 24,
                height: 24,

              ),
              activeIcon: Image.asset(
                'assets/images/calendarLogo.png',
                width: 24,
                height: 24,
                color: Pallete.primary,
              ),
            ),

            BottomNavigationBarItem(
              label: "Cycle",
              icon: Image.asset(
                'assets/images/4th.png',
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/4th.png',
                width: 24,
                height: 24,
                color: Pallete.primary,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_2_rounded),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}