import 'package:champe/pages/bottomPages/home/widget/postCardAudio.dart';
import 'package:champe/pages/bottomPages/home/widget/postCardText.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarked extends StatefulWidget {
  const BookMarked({super.key});

  @override
  State<BookMarked> createState() => _BookMarkedState();
}

class _BookMarkedState extends State<BookMarked> {
  @override
  Widget build(BuildContext context) {
    var notch = 10.0;
    if (MediaQuery.of(context).viewPadding.top > 0) {
      notch = 40.0;
    }
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Column(
        children: [
          SizedBox(
            height: notch == 10 ? 38 : 70,
            child: Stack(
              children: [
                Positioned(
                  top: notch,
                  left: 0,
                  right: 0,
                  child: const Center(
                      child: Text(
                        "Bookmark",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorList.black,
                            fontSize: 25),
                      )),
                ),
              ],
            ),
          ),
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
          )
        ],
      ),
    );
  }
}
