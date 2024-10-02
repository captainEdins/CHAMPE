import 'dart:async';

import 'package:flutter/material.dart';
import 'package:champe/landingPage/landingPage.dart';
import 'package:champe/resource/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3200), () async {
      openMe();
    });

    return Scaffold(
      backgroundColor: ColorList.white,
        body: Center(
          child: SizedBox(
            height: (MediaQuery.of(context).size.height / 2) + 80,
            width: (MediaQuery.of(context).size.width / 2) + 80,
            child: Hero(tag: "logo", child: Image.asset("images/logo.png")),
          ),
        ));

  }

  void openMe() async {
    final prefs = await SharedPreferences.getInstance();
    final getIn = prefs.getString('in') ?? "";
    final getRole = prefs.getString('role') ?? "driver";
    final getExpiry = prefs.getBool('message_expiry') ?? true;

    if(getExpiry == true){
      if (getIn != "") {
        //open the main
        openHome(getRole);
      } else {
        openStartPage();
      }
    }else{
     // openExpiry();
    }

  }

  void openHome(String getRole) {
    // if (getRole == "driver") {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const Driver()));
    // } else {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Company()));
    // }
  }

  void openStartPage() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const LandingPage();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  // void openExpiry() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const ExpiryPage()));
  // }
}
