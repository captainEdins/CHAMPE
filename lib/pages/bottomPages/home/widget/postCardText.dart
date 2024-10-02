import 'package:champe/pages/bottomPages/widget/like_animation.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class PostCardText extends StatefulWidget {
  const PostCardText({Key? key}) : super(key: key);

  @override
  State<PostCardText> createState() => _PostCardTextState();
}

class _PostCardTextState extends State<PostCardText> {

  int commentLen = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: ColorList.black,
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
    return const ReadMoreText(
      'Flutter is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
      trimLines: 5,
      trimMode: TrimMode.Length,
      trimCollapsedText: 'more',
      trimExpandedText: 'less',
      style:TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ColorList.white) ,
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: ColorList.white),
      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: ColorList.white),
    );
  }

  Widget topSection(){
    return  Row(
      children:  [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/13009437/pexels-photo-13009437.jpeg",
          ),
          radius: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "John Doe",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: ColorList.white,
                fontSize: 14,
              ),
            ),
            Text(
              "@jemoKe",
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: ColorList.white,
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
                backgroundColor: ColorList.white,
                child: IconButton(
                  icon: "me" == "me"
                      ? SvgPicture.asset(
                    "images/heart-shape-outine.svg",
                    color: ColorList.black,
                    fit: BoxFit.fill,
                  )
                      : SvgPicture.asset(
                    "images/heart-shape-silhouette.svg",
                    color: ColorList.black,
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
                  color: ColorList.white,
                ),
                height: 36,
                width: 36,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    "images/comment-option.svg",
                    color: ColorList.black,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorList.white,
            ),
                height: 36,
                width: 36,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "images/bookmark-black-shape.svg",
                color: ColorList.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorList.white,
            ),
                height: 36,
                width: 36,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "images/plane.svg",
                color: ColorList.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
