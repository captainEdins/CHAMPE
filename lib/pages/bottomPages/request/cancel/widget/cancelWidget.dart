import 'package:champe/pages/bottomPages/request/cancel/cancelPage.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
class CancelWidget extends StatefulWidget {
  const CancelWidget({Key? key}) : super(key: key);

  @override
  _CancelWidgetState createState() => _CancelWidgetState();
}

class _CancelWidgetState extends State<CancelWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 230,
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: ColorList.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'Cancel Appointment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorList.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Are you sure you want to cancel this appointment? Only 50% will be refunded ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorList.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(height: 10,),
              bottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomButtons(){
    return Row(
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
                  color: ColorList.white,
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

              Navigator.pop(context);

              pushNewScreen(
                context,
                screen:  CancelPage(),
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
                  color: ColorList.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Next',
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
    );
  }
}
