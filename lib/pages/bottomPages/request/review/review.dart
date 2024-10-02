import 'package:champe/pages/bottomPages/request/reschedule/widget/optionRadio.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Review extends StatefulWidget {
  Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {



  late int selectedButton = 0;
  late bool otherMore = false;

  @override
  Widget build(BuildContext context) {
    var notch = 10.0;
    if (MediaQuery.of(context).viewPadding.top > 0) {
      notch = 40.0;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorList.white,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: notch == 10 ? 38 : 70,
                child: Stack(
                  children: [
                    Positioned(
                      top: notch,
                      left: 0,
                      right: 0,
                      child:  const Center(
                          child: Text(
                            "Write a review",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: ColorList.purple,
                                fontSize: 20),
                          )),
                    ),
                    Positioned(
                        top: notch,
                        left: 15,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.keyboard_backspace_rounded,
                            color: ColorList.black,
                            size: 30,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: 170.0,
                            width: 140.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/doctor.jpg")),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text('How was your experience with',
                              style: TextStyle(
                                  color: ColorList.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                          const Text('Dr.Muhammed Syahid',
                              style: TextStyle(
                                  color: ColorList.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          const Text(
                            'Dental Specialist',
                            style: TextStyle(
                                color: ColorList.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 20,),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: ColorList.black,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Container(height: 1,color: ColorList.black.withOpacity(.2),margin: const EdgeInsets.all(20),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Write your review',
                          style: TextStyle(
                              color: ColorList.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                    inputComment(),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Would you recommend Dr. Hannah Baker to your friends?',
                          style: TextStyle(
                              color: ColorList.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                   Row(
                     children: [
                       Expanded(
                         child: OptionRadio(
                             text: "Yes",
                             index: 0,
                             selectedButton: selectedButton,
                             press: (val) {
                               print("one");
                               setState(() {
                                 selectedButton = val;
                               });
                             }),
                       ),
                       Expanded(
                         child: OptionRadio(
                             text: "No",
                             index: 1,
                             selectedButton: selectedButton,
                             press: (val) {
                               setState(() {
                                 print("two");
                                 selectedButton = val;
                               });
                             }),
                       ),
                     ],
                   ),
                   const SizedBox(height: 150,)
                   // _timePicker()
                  ],
                ),
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
                  color: ColorList.purple,
                ),
              )),
          Positioned(
              bottom: 10,
              right: 35,
              left: 35,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorList.purple,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorList.black, // Set border color
                                width: 1.0),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: ColorList.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorList.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: ColorList.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }


  TextEditingController getComment = TextEditingController();

  String get comment => getComment.text.trim();

  Widget inputComment() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              cursorColor: ColorList.black.withOpacity(.5),
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  color: ColorList.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              controller: getComment,
              maxLines: 8,
              maxLength: 350,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: ColorList.black.withOpacity(.15),
                hintText: 'Your review',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorList.black.withOpacity(.0),
                  ), //<-- SEE HERE
                ),
                hintStyle: const TextStyle(
                    color: ColorList.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                labelStyle: const TextStyle(
                    color: ColorList.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 1, color: ColorList.black.withOpacity(.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

