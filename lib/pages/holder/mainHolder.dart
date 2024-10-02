import 'package:champe/pages/bottomPages/bookmarked/bookMarked.dart';
import 'package:champe/pages/bottomPages/home/home.dart';
import 'package:champe/pages/bottomPages/request/request.dart';
import 'package:champe/pages/widgets/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:champe/resource/color.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({Key? key}) : super(key: key);

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  late PersistentTabController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  int item = 0;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      margin: const EdgeInsets.only(left: 70,right: 70,bottom: 20),
      screens: _buildScreens(),
      items: _navBarsItems(),
      onItemSelected: (selected){
        setState(() {
          item = selected;
        });
      },
      confineInSafeArea: true,
      backgroundColor: ColorList.black.withOpacity(.1),
      // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration:  NavBarDecoration(
        colorBehindNavBar: ColorList.white,
        borderRadius: BorderRadius.circular(100.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 20),
        curve: Curves.bounceInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.bounceInOut,
        duration: Duration(milliseconds: 20),
      ),
      navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item == 0 ? ColorList.black : ColorList.iconBackground,
              borderRadius:
              const BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(CupertinoIcons.house_fill,
              color: ColorList.white,
              size: 22,
            )),
        activeColorPrimary: ColorList.white,
        inactiveColorPrimary: ColorList.white,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item == 1 ? ColorList.black : ColorList.iconBackground,
              borderRadius:
              const BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(CupertinoIcons.calendar,
              color: ColorList.white,
              size: 22,
            )),
        activeColorPrimary: ColorList.white,
        inactiveColorPrimary: ColorList.white,
      ), PersistentBottomNavBarItem(
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item == 2 ? ColorList.black : ColorList.iconBackground,
              borderRadius:
              const BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(CupertinoIcons.bookmark,
              color: ColorList.white,
              size: 22,
            )),
        activeColorPrimary: ColorList.white,
        inactiveColorPrimary: ColorList.white,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item == 3 ? ColorList.black : ColorList.iconBackground,
              borderRadius:
              const BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(CupertinoIcons.settings,
              color: ColorList.white,
              size: 22,
            )),
        activeColorPrimary: ColorList.white,
        inactiveColorPrimary: ColorList.white,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Request(),
      const BookMarked(),
      const ProfilePage(),
    ];
  }



  Widget containerHere(String textHere){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(20.0),
        ),
        Column(
          children:  <Widget>[
            Center(
              child: Text(textHere,
                  style: const TextStyle(
                    fontSize: 21,fontWeight: FontWeight.w900,color: ColorList.green,),textAlign: TextAlign.center
              ),
            ),
          ],
        ),
      ],
    );
  }

}