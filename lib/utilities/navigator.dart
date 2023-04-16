import 'package:flutter/material.dart';
import 'package:nextmovie_v2/Pages/home_page.dart';
import 'package:nextmovie_v2/Pages/profile_page.dart';
import 'package:nextmovie_v2/reusable_widgets/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    homescreenPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigator()),
        );
        return true;
      },
      child: Scaffold(
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
                gap: 7,
                haptic: true,
                padding: const EdgeInsets.fromLTRB(65, 16, 65, 16),
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: " Home",
                  ),
                  GButton(
                    icon: Icons.account_circle_outlined,
                    text: " Profile",
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          )),
    );
  }
}
