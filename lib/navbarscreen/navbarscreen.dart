import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/navbarscreen/historyscreen.dart';
import 'package:riderapp/navbarscreen/homescreen.dart';
import 'package:riderapp/navbarscreen/progresscreen.dart';
import 'package:riderapp/screen%20/helpsupportscreen.dart';
import 'package:riderapp/screen%20/loginscreen.dart';
import 'package:riderapp/screen%20/profillescreen.dart';
import 'package:riderapp/widget/menubtn.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int selectedIndex = 0;
  bool openSheet = false;

  final screens = const [HomeScreen(), ProgressScreen(), HistoryScreen()];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List menuButtons = <Widget>[
      MenuButton(
          icons: SvgPicture.asset("icons/profileicon.svg"),
          name: "Profile",
          func: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()))),
      MenuButton(
          icons: SvgPicture.asset("icons/cardIcon.svg"),
          name: "Bank Info",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset("icons/ratingsIcon.svg"),
          name: "Ratings",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset("icons/assetsIcons.svg"),
          name: "Assets",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset("icons/helpicon.svg"),
          name: "Help",
          func: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HelpAndSupportScreen()))),
      MenuButton(
          icons: SvgPicture.asset("icons/langangeicon.svg"),
          name: "Insurance",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset("icons/ClipboardCheck.svg"),
          name: "Privacy Policy",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset(
            "icons/FileEarmarkText.svg",
            width: 30,
            height: 30,
          ),
          name: "Term & Condition",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset(
            "icons/logout.svg",
            width: 10,
            height: 40,
          ),
          name: "Logout",
          func: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const LoginScreen())));
          }),
    ];
    Future navMenu() {
      return showModalBottomSheet(
        builder: (BuildContext context) => SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(Icons.arrow_forward_ios_rounded)),
                      )
                    ]),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: menuButtons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width < 440 ? 3 : 7),
                  itemBuilder: (context, index) => menuButtons[index],
                )
              ],
            ),
          ),
        ),
        context: context,
      );
    }

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navbaricons/homeicon.svg',
              color: selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navbaricons/progressicon.svg',
              color: selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navbaricons/historyicon.svg',
              color: selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (Icon(
              Icons.menu,
              color: Colors.grey.shade300,
            )),
            label: '',
          ),
        ],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromRGBO(165, 153, 153, 1),
        onTap: (index) => {
          setState(() {
            if (index == 3) {
              openSheet = true;
              navMenu();
            } else {
              selectedIndex = index;
            }
          }),
        },
      ),
    );
  }
}
