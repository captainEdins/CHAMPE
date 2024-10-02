import 'package:cached_network_image/cached_network_image.dart';
import 'package:champe/pages/bottomPages/home/messages/message/inbox.dart';
import 'package:champe/resource/color.dart';
import 'package:champe/resource/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    var notch = 10.0;
    if (MediaQuery.of(context).viewPadding.top > 0) {
      notch = 40.0;
    }
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            SizedBox(
              height: notch,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(
                      CupertinoIcons.arrow_left_circle_fill,
                      color: ColorList.black,
                      size: 25,
                    ),
                  ),
                ),
                const Text(
                  "Messages",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: ColorList.black,
                      fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(child:
            ListView(
              padding: EdgeInsets.zero,
              children: [
                botChatAI("Talk with Linda"),
                Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 10),
                  color: ColorList.black.withOpacity(.1),
                  height: 1,),
                communityBox(
                    img: 'https://images.pexels.com/photos/6129203/pexels-photo-6129203.jpeg?auto=compress&cs=tinysrgb&w=600',
                    doctorName: 'Dr.Malombe Kilo',
                    doctorTitle: 'Psychologists',
                    phoneNumber: "07654236542"
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 10),
                  color: ColorList.black.withOpacity(.1),
                  height: 1,),
                communityBox(
                    img: 'https://images.pexels.com/photos/3825457/pexels-photo-3825457.jpeg?auto=compress&cs=tinysrgb&w=600',
                    doctorName: 'Dr.Muhammed Syahid',
                    doctorTitle: 'Psychiatrists',
                    phoneNumber: "075752136542"
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget botChatAI(String title) {
    return InkWell(
      onTap: () {

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Inbox(
                    name: "Linda",
                    receiverId: Strings.userGPT,
                    status: "I may know your problem",
                    senderId: "us63246543265432",
                    receiverCode: "gpt")));

      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorList.black.withOpacity(.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration:  BoxDecoration(
                  color: ColorList.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.category_rounded,
                  color: ColorList.white,
                  size: 20,
                )),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorList.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          const Text(
                            "I may know your problem",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: ColorList.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget communityBox({required String img,
    required String doctorName,
    required String phoneNumber,
    required String doctorTitle,}) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: Inbox(
              name: doctorName,
              receiverId: phoneNumber,
              status: doctorTitle,
              senderId: phoneNumber,
              dp: img,
              receiverCode: phoneNumber),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideRight,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: img,
              width: 40,
              height: 40,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ColorList.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            doctorTitle,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: ColorList.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
