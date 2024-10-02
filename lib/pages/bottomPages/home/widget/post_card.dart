import 'dart:ui';

import 'package:champe/pages/bottomPages/home/widget/clipper/myCustomClipperPost.dart';
import 'package:champe/pages/bottomPages/widget/like_animation.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchCommentLen();
  // }
  //
  // fetchCommentLen() async {
  //   try {
  //     QuerySnapshot snap = await FirebaseFirestore.instance
  //         .collection('posts')
  //         .doc(widget.snap['postId'])
  //         .collection('comments')
  //         .get();
  //     commentLen = snap.docs.length;
  //   } catch (err) {
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  //   setState(() {});
  // }
  //
  // deletePost(String postId) async {
  //   try {
  //     await FireStoreMethods().deletePost(postId);
  //   } catch (err) {
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(35.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ).createShader(
                    Rect.fromLTRB(0, 300, rect.width, rect.height - 1));
              },
              blendMode: BlendMode.darken,
              child: GestureDetector(
                onDoubleTap: () {
                  // FireStoreMethods().likePost(
                  //   widget.snap['postId'].toString(),
                  //   user.uid,
                  //   widget.snap['likes'],
                  // );
                  setState(() {
                    isLikeAnimating = true;
                  });
                },
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 1.45,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/13009437/pexels-photo-13009437.jpeg"),
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isLikeAnimating ? 1 : 0,
                    child: LikeAnimation(
                      isAnimating: isLikeAnimating,
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      onEnd: () {
                        setState(() {
                          isLikeAnimating = false;
                        });
                      },
                      child: SvgPicture.asset(
                        "images/heart-shape-silhouette.svg",
                        color: const Color(0xffc9c9c9).withOpacity(0.5),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          //Side-bar Container
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: ColorList.white.withOpacity(.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/13009437/pexels-photo-13009437.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: ColorList.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 60),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: ColorList.white),
                        children: [
                          "mea" != "me"
                              ? TextSpan(
                                  text: "Jane Doe ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: ColorList.black,
                                    fontSize: 14,
                                  ),
                                )
                              : TextSpan(
                                  text: "",
                                ),
                          TextSpan(
                            text:
                                'alot of this in this world happen for a fucking resaon',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ColorList.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "me" != "me"
                          ? const Text(
                              "John Doe",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: ColorList.white,
                                fontSize: 14,
                              ),
                            )
                          : const Text(""),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      "me" == "me" ? 'Delete' : '',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                //delete post

                                                // remove the dialog box
                                                //Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList()),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          color: ColorList.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -5,
            top: MediaQuery.of(context).size.shortestSide < 600
                ? (MediaQuery.of(context).size.width * 1.45 -
                        MediaQuery.of(context).size.width * 1.25) /
                    2
                : (MediaQuery.of(context).size.width * 1.45 -
                        MediaQuery.of(context).size.width * 0.7) /
                    2,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.shortestSide < 600
                      ? 115
                      : 180,
                  height: MediaQuery.of(context).size.shortestSide < 600
                      ? MediaQuery.of(context).size.width * 1.25
                      : MediaQuery.of(context).size.width * 0.7,
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: SvgPicture.asset(
                        "images/side-bar.svg",
                        color: ColorList.white.withOpacity(0.1),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.width * 1.25) / 8.1,
                        bottom:
                            (MediaQuery.of(context).size.width * 1.25) / 8.1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LikeAnimation(
                            isAnimating: false,
                            smallLike: true,
                            child: Column(children: [
                              CircleAvatar(
                                radius: 30,
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
                              const Center(
                                  child: Text("100",
                                      style: TextStyle(
                                        color: ColorList.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      )))
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
                                height: 60,
                                width: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(17.0),
                                  child: SvgPicture.asset(
                                    "images/comment-option.svg",
                                    color: ColorList.white,
                                  ),
                                ),
                              ),
                              Center(
                                  child: Text("$commentLen",
                                      style: const TextStyle(
                                        color: ColorList.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      )))
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
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
