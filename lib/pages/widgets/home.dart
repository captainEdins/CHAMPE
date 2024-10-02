import 'dart:convert';

import 'package:champe/resource/color.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Column(
        children: [
          topImageNotification(),
          header(),
          motivation(),
          Expanded(child: nextMeeting())
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Hero(
              tag: 'appName',
              child: Material(
                  type: MaterialType.transparency,
                  child: Image.asset(
                    "images/logo.png",
                    width: 100,
                  ))),
          GestureDetector(
              onTap: () {
                // pushNewScreen(
                //   context,
                //   screen: const CompanyNotification(),
                //   withNavBar: false, // OPTIONAL VALUE. True by default.
                //   pageTransitionAnimation: PageTransitionAnimation.slideRight,
                // );
              },
              child: const Icon(
                Icons.notifications_none_rounded,
                color: ColorList.black,
                size: 30,
              )),
        ],
      ),
    );
  }

  var name = "";

  Widget header() {
    var timeNow = DateTime.now().hour;
    var date = DateTime.now();

    var greetings = "";
    var nameUser = name;

    if (timeNow <= 12) {
      greetings = 'Good Morning,';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      greetings = 'Good Afternoon,';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      greetings = 'Good Evening,';
    } else {
      greetings = 'Good Night,';
    }

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greetings,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorList.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: ColorList.lightGrey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Text(
            DateFormat('EE, d MMM').format(date),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              color: ColorList.black,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();
    final getName = prefs.getString('name') ?? "John Doe";

    setState(() {
      name = getName;
    });

   // callChatGPT("hello k");
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

  Widget nextMeeting() {
    var date = DateTime.now();
    return PhysicalModel(
        color: ColorList.black,
        elevation: 3,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              child: const Text(
                'Next Meeting',
                style: TextStyle(
                  color: ColorList.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 60,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: ColorList.navy,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0)),
                    ),
                    child: Text(
                      DateFormat('d MMM').format(date),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorList.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        height: 60,
                    decoration:   BoxDecoration(
                      color: ColorList.navy.withOpacity(.7),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                              Text(
                                "17:00",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                  color: ColorList.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Jane Mawali",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                  color: ColorList.lightGrey,
                                ),
                                textAlign: TextAlign.left,
                              ),
                          ],
                        ),
                            )),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.more_horiz_rounded,
                            color: ColorList.white,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
             Expanded(child: feeling())
          ],
        ));
  }

  Widget feeling() {

    return PhysicalModel(
        color: ColorList.white,
        elevation: 2,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              child: const Text(
                'How are you feeling now?',
                style: TextStyle(
                  color: ColorList.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
           Expanded(child: ListView(
             padding: EdgeInsets.zero,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   projectHolder(getTitle: 'happy', back: ColorList.gold),
                   projectHolder(getTitle: 'calm', back: ColorList.blue),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   projectHolder(getTitle: 'great', back: ColorList.violet),
                   projectHolder(getTitle: 'good', back: ColorList.black),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   projectHolder(getTitle: 'sad', back: ColorList.pink),
                   projectHolder(getTitle: 'neutral', back: ColorList.purple),
                 ],
               ),
               projectHolder(getTitle: 'angry', back: ColorList.greenMain),

               const SizedBox(height: 40,)
             ],
           ))
          ],
        ));
  }

  Widget projectHolder({required String getTitle,required Color back}){
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
      height: 110,
      width: getTitle != "angry" ? 120 : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
       color: back.withOpacity(.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getTitle,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: ColorList.black,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }

  Future<String?> callChatGPT(String prompt) async {
    const apiKey = "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";
    const apiUrl = "https://api.openai.com/v1/completions";

    var error = "error occurred please try again";

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    };

    final body = jsonEncode(
      {
        "model": "text-davinci-003",
        'prompt': prompt,
        'max_tokens': 7, // Adjust as needed
      },
    );
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final result = jsonResponse['choices'][0]['text'];
        return result;
      } else {
        print(
          'Failed to call ChatGPT API: ${response.statusCode} ${response.body}',
        );
        return error;
      }
    } catch (e) {
      print("Error calling ChatGPT API: $e");
      return error;
    }
  }
}
