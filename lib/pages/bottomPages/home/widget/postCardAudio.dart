import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:champe/pages/bottomPages/widget/like_animation.dart';
import 'package:champe/resource/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class PostCardAudio extends StatefulWidget {
  const PostCardAudio({Key? key}) : super(key: key);

  @override
  State<PostCardAudio> createState() => _PostCardAudioState();
}

class _PostCardAudioState extends State<PostCardAudio> {

  int commentLen = 0;
  late final PlayerController playerController;

  void _initialiseController() {
    playerController = PlayerController();
  }

  String? path;
  late Directory directory;

  @override
  void initState() {
    super.initState();
    _initialiseController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: ColorList.black.withOpacity(.1),
          ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              topSection(),
              textMore(),
              actionPost()
            ],
          ),
        ),
      ),
    );
  }

  Widget textMore(){
    return  AudioFileWaveforms(
      size: Size(MediaQuery.of(context).size.width , 55),
      playerController: playerController,
      enableSeekGesture: true,
      waveformType: WaveformType.long,
      playerWaveStyle:  const PlayerWaveStyle(
        scaleFactor: 0.8,
        spacing: 6,
        fixedWaveColor: ColorList.black,
        liveWaveColor: ColorList.black,
        waveCap: StrokeCap.round,
      ),
    );
  }

  Widget topSection(){
    return  const Row(
      children:  [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/13009437/pexels-photo-13009437.jpeg",
          ),
          radius: 15,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: ColorList.black,
                fontSize: 14,
              ),
            ),
            Text(
              "@jemoKe",
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: ColorList.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget actionPost(){
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LikeAnimation(
            isAnimating: false,
            smallLike: true,
            child: Column(children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: ColorList.black,
                child: IconButton(
                  icon: "me" == "me"
                      ? SvgPicture.asset(
                    "images/heart-shape-outine.svg",
                    color: ColorList.white,
                    fit: BoxFit.fill,
                  )
                      : SvgPicture.asset(
                    "images/heart-shape-silhouette.svg",
                    color: ColorList.white,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorList.black,
                ),
                height: 36,
                width: 36,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    "images/comment-option.svg",
                    color: ColorList.white,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorList.black,
            ),
            height: 36,
            width: 36,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "images/bookmark-black-shape.svg",
                color: ColorList.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorList.black,
            ),
            height: 36,
            width: 36,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "images/plane.svg",
                color: ColorList.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
