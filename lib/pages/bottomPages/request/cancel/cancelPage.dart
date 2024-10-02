import 'package:champe/pages/bottomPages/request/reschedule/widget/optionRadio.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';

class CancelPage extends StatefulWidget {
  CancelPage({Key? key}) : super(key: key);

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {



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
                            "Cancel Appointment",
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10,bottom: 10),
                      child: Text('Reason for cancellation',
                          style: TextStyle(
                              color: ColorList.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    OptionRadio(
                        text: "I want to change to another doctor",
                        index: 0,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = false;
                          });
                        }),
                    OptionRadio(
                        text: "I want to change package",
                        index: 1,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = false;
                          });
                        }),
                    OptionRadio(
                        text: "I don’t want to consult",
                        index:2,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = false;
                          });
                        }),
                    OptionRadio(
                        text: "I have recovered from my illness",
                        index: 3,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = false;
                          });
                        }),
                    OptionRadio(
                        text: "I have found suitable medicine",
                        index: 4,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = false;
                          });
                        }),
                    OptionRadio(
                        text: "I just want to cancel",
                        index: 5,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = false;
                          });
                        }),
                    OptionRadio(
                        text: "Others",
                        index: 6,
                        selectedButton: selectedButton,
                        press: (val) {
                          setState(() {
                            selectedButton = val;
                            otherMore = true;
                          });
                        }),
                    inputComment(),
                    const SizedBox(height: 100,)
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
                      'Finish',
                      style: TextStyle(
                        color: ColorList.white,
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


  TextEditingController getComment = TextEditingController();

  String get comment => getComment.text.trim();

  Widget inputComment() {
    return Visibility(
      visible: otherMore,
      child: Padding(
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
                  hintText: 'Your reason for rescheduling the appointment',
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
      ),
    );
  }

}