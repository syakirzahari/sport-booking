import 'package:flutter/material.dart';
import 'package:sport_booking/pages/book.dart';
import 'package:sport_booking/pages/home.dart';
import 'package:sport_booking/pages/list_book.dart';
import 'package:sport_booking/pages/lookingopponent.dart';
import 'package:sport_booking/pages/settings/profile.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  NavBarPageState createState() => NavBarPageState();
}

class NavBarPageState extends State<NavBarPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    InstantBookingPage(),
    LookingOpponentPage(),
    ListBookPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 20,
      //         color: Colors.black.withOpacity(.1),
      //       )
      //     ],
      //   ),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      //       child: GNav(
      //         rippleColor: Colors.grey[300]!,
      //         hoverColor: Colors.grey[100]!,
      //         gap: 8,
      //         activeColor: Colors.black,
      //         iconSize: 24,
      //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      //         duration: const Duration(milliseconds: 400),
      //         tabBackgroundColor: Colors.grey[100]!,
      //         color: Colors.black,
      //         tabs: [
      //           GButton(
      //             icon: LineIcons.home,
      //             text: 'Home',
      //             textColor: Colors.red[800],
      //           ),
      //           GButton(
      //             icon: LineIcons.calendar,
      //             text: 'Booking',
      //             textColor: Colors.red[800],
      //           ),
      //           GButton(
      //             icon: LineIcons.list,
      //             text: 'My Booking',
      //             textColor: Colors.red[800],
      //           ),
      //           GButton(
      //             icon: LineIcons.user,
      //             text: 'Profile',
      //             textColor: Colors.red[800],
      //           ),
      //         ],
      //         selectedIndex: _selectedIndex,
      //         onTabChange: (index) {
      //           setState(() {
      //             _selectedIndex = index;
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: StylishBottomBar(
//  option: AnimatedBarOptions(
//    iconSize: 32,
//    barAnimation: BarAnimation.liquid,
//    iconStyle: IconStyle.animated,
//    opacity: 0.3,
//  ),
//  option: BubbleBarOptions(
//    barStyle: BubbleBarStyle.horizotnal,
//    // barStyle: BubbleBarStyle.vertical,
//    bubbleFillStyle: BubbleFillStyle.fill,
//    // bubbleFillStyle: BubbleFillStyle.outlined,
//    opacity: 0.3,
//  ),
        option: DotBarOptions(
          dotStyle: DotStyle.tile,
          gradient: const LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pink,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.abc),
            title: const Text('Abc'),
            backgroundColor: Colors.red,
            selectedIcon: const Icon(Icons.read_more),
          ),
          BottomBarItem(
            icon: const Icon(Icons.safety_divider),
            title: const Text('Safety'),
            backgroundColor: Colors.orange,
          ),
          BottomBarItem(
            icon: const Icon(Icons.cabin),
            title: const Text('Cabin'),
            backgroundColor: Colors.purple,
          ),
        ],
        fabLocation: StylishBarFabLocation.end,
        hasNotch: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // bottomNavigationBar: StylishBottomBar(
      //   items: [
      //     AnimatedBarItems(
      //         icon: const Icon(
      //           Icons.house_outlined,
      //         ),
      //         selectedIcon: const Icon(Icons.house_rounded),
      //         selectedColor: Colors.red[800]!,
      //         backgroundColor: Colors.amber,
      //         title: const Text('Home')),
      //     AnimatedBarItems(
      //         icon: const Icon(
      //           Icons.list,
      //         ),
      //         selectedIcon: const Icon(
      //           Icons.list,
      //         ),
      //         selectedColor: Colors.red[800]!,
      //         backgroundColor: Colors.amber,
      //         title: const Text('Advance')),
      //     AnimatedBarItems(
      //         icon: const Icon(
      //           Icons.style_outlined,
      //         ),
      //         selectedIcon: const Icon(
      //           Icons.style,
      //         ),
      //         backgroundColor: Colors.amber,
      //         selectedColor: Colors.red[800]!,
      //         title: const Text('Find')),
      //     AnimatedBarItems(
      //         icon: const Icon(
      //           Icons.calendar_today_outlined,
      //         ),
      //         selectedIcon: const Icon(
      //           Icons.calendar_today_outlined,
      //         ),
      //         backgroundColor: Colors.amber,
      //         selectedColor: Colors.red[800]!,
      //         title: const Text('My Booking')),
      //     AnimatedBarItems(
      //         icon: const Icon(
      //           Icons.person_outline,
      //         ),
      //         selectedIcon: const Icon(
      //           Icons.person,
      //         ),
      //         backgroundColor: Colors.amber,
      //         selectedColor: Colors.red[800]!,
      //         title: const Text('Menu')),
      //   ],
      //   iconSize: 32,
      //   barAnimation: BarAnimation.fade,
      //   // iconStyle: IconStyle.animated,

      //   iconStyle: IconStyle.animated,
      //   hasNotch: true,
      //   opacity: 0.3,
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index!;
      //     });
      //   },
      // ),
    );
  }
}
