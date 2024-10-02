
import 'package:champe/pages/bottomPages/home/messages/message.dart';
import 'package:champe/pages/bottomPages/home/widget/postCardAudio.dart';
import 'package:champe/pages/bottomPages/home/widget/postCardText.dart';
import 'package:champe/pages/bottomPages/home/widget/post_card.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorList.white,
      body: Column(
        children: [
          topImageNotification(),
          motivation(),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                PostCardText(),
                PostCardAudio(),
                PostCardText(),
                PostCardAudio(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topImageNotification() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top > 0 ? 40 : 10,
          left: 5,
          right: 5,
          bottom: 5),
      child: Row(
        children: <Widget>[
          Image.asset(
            "images/logo.png",
            width: 100,
          ),
          const Spacer(),
          InkWell(
            onTap: (){
              pushNewScreen(
                context,
                screen:  const Messages(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.slideRight,
              );
            },
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration:  BoxDecoration(
                  color: ColorList.black.withOpacity(.1),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: const Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  color: ColorList.black,
                  size: 23,
                )),
          ),
          const SizedBox(width: 10,),
          Container(
              padding: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: ColorList.black.withOpacity(.1),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: const Icon(
                CupertinoIcons.bell,
                color: ColorList.black,
                size: 23,
              )),
        ],
      ),
    );
  }


  Widget motivation() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            "To succeed takes more than the desire to win. It also takes the acceptance that we could fail.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorList.black,
            ),
            textAlign: TextAlign.left,
          ),
          Row(
            children: const [
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  "by ~ Simon Sinek",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorList.lightGrey,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
