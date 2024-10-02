import 'package:champe/authetication/login.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorList.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) + 100,
                  width: (MediaQuery.of(context).size.width / 2) + 100,
                  child: Hero(tag: "logo", child: Image.asset("images/logo.png")),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
                child: const Text(
                  'Start therapy   that works for you',
                  style: TextStyle(
                    color: ColorList.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
                child: const Text(
                  'Affordable and effective mental health care from licensed providers, In-person or online and many more',
                  style: TextStyle(
                    color: ColorList.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              buttonSkip(),
            ],
          ))
        ],
      ),
    );
  }

  Widget buttonSkip() {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
      child: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorList.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'GET STARTED',
                style: TextStyle(
                  color: ColorList.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
               Icon(
                Icons.arrow_right_alt_rounded,
                color: ColorList.white,
                size: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
