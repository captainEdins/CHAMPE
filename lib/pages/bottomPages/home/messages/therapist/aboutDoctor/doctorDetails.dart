import 'package:cached_network_image/cached_network_image.dart';
import 'package:champe/pages/bottomPages/request/book/book.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DoctorDetails extends StatefulWidget {


   String img;
   String doctorName;
   String doctorTitle;
   double rating;
   String about;

   DoctorDetails({Key? key, required this.img, required this.doctorName, required this.rating, required this.doctorTitle, required this.about}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    var notch = 10.0;
    if (MediaQuery.of(context).viewPadding.top > 0) {
      notch = 40.0;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorList.black,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: ((MediaQuery.of(context).size.height / 5) + 75),
                decoration: const BoxDecoration(
                  color: ColorList.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: notch,
                      left: 0,
                      right: 0,
                      child:  Row(
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
                            "Doctor Details",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorList.black,
                                fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: notch + 20,
                        left: 30,
                        right: 30,
                        bottom: 0,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.img,
                              width: 110,
                              height: 140,
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Column(
                                      children:  [
                                        Text(widget.doctorName,
                                            style: const TextStyle(
                                                color: ColorList.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                        Text(
                                          widget.doctorTitle,
                                          style: const TextStyle(
                                              color: ColorList.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: ColorList.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: ColorList.black
                                                        .withOpacity(.3),
                                                    blurRadius: 1,
                                                    offset: const Offset(1,
                                                        1), // Shadow position
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.star_rounded,
                                                size: 20,
                                                color: ColorList.gold,
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Rating',
                                                style: TextStyle(
                                                    color: ColorList.black,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                '${widget.rating.toString()} out of 5',
                                                style: const TextStyle(
                                                    color: ColorList.black,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: ColorList.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: ColorList.black
                                                        .withOpacity(.3),
                                                    blurRadius: 1,
                                                    offset: const Offset(1,
                                                        1), // Shadow position
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons
                                                    .supervisor_account_outlined,
                                                size: 20,
                                                color: ColorList.black,
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Patients',
                                                style: TextStyle(
                                                    color: ColorList.black,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                '10000+',
                                                style: TextStyle(
                                                    color: ColorList.black,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height -
                        ((MediaQuery.of(context).size.height / 5) + 75),
                    color: ColorList.white,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        ((MediaQuery.of(context).size.height / 5) + 75),
                    decoration: const BoxDecoration(
                      color: ColorList.black,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60)),
                    ),
                    child: Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          biography(),
                          workingHours(),
                          location(),
                          reviews(),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                child: Image.asset(
                  "images/bottom_nav.png",
                  color: ColorList.black,
                ),
              )),
          Positioned(
              bottom: 10,
              right: 35,
              left: 35,
              child: InkWell(
                onTap: () {
                  pushNewScreen(
                    context,
                    screen:  Book(title : "Schedule Booking"),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.slideRight,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorList.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: ColorList.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget biography() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text('Biography',
              style: TextStyle(
                  color: ColorList.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 7,
          ),
          Text(
              widget.about,
              style: const TextStyle(
                  color: ColorList.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w300))
        ],
      ),
    );
  }

  Widget workingHours() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 20, top: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Working Time',
              style: TextStyle(
                  color: ColorList.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 7,
          ),
          Text('Mon-Sat (8:00am-5:30pm)',
              style: TextStyle(
                  color: ColorList.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w300))
        ],
      ),
    );
  }

  Widget location() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Location',
              style: TextStyle(
                  color: ColorList.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 7,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 161,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/location.png")),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget reviews() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: TextStyle(
                    color: ColorList.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                'See all',
                style: TextStyle(
                    color: ColorList.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          reviewRoll(),
          const SizedBox(
            height: 5,
          ),
          reviewRoll(),
        ],
      ),
    );
  }

  // CircleAvatar(
  // backgroundImage: AssetImage('assets/doctor01.jpeg'),
  // )
  Widget reviewRoll() {
    return Container(
      decoration: const BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/doctor.jpg'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('John Doe',
                              style: TextStyle(
                                  color: ColorList.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                          Container(
                              height: 25,
                              width: 43,
                              decoration: const BoxDecoration(
                                color: ColorList.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 18,
                                    color: ColorList.white,
                                  ),
                                  Text('4.5',
                                      style: TextStyle(
                                          color: ColorList.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400))
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                  'Awesome! This is what I was looking for. I recommend everyone for this moving forward. You were a saviour saviour saviour',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorList.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w300)),
              Row(
                children: [
                  const Icon(
                    Icons.favorite_rounded,
                    size: 20,
                    color: ColorList.red,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text('637',
                      style: TextStyle(
                          color: ColorList.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w100)),
                  const SizedBox(
                    width: 3,
                  ),
                  Text('3 weeks ago',
                      style: TextStyle(
                          color: ColorList.black.withOpacity(.4),
                          fontSize: 11,
                          fontWeight: FontWeight.w300)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
