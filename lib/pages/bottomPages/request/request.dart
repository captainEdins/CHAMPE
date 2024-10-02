
import 'package:champe/pages/bottomPages/request/book/book.dart';
import 'package:champe/pages/bottomPages/request/cancel/widget/cancelWidget.dart';
import 'package:champe/pages/bottomPages/request/reschedule/reschedule.dart';
import 'package:champe/pages/bottomPages/request/review/review.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {

  final _gKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var notch = 10.0;
    if (MediaQuery.of(context).viewPadding.top > 0) {
      notch = 40.0;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _gKey,
      backgroundColor: ColorList.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: notch == 10 ? 38 : 70,
            child: Stack(
              children: [
                Positioned(
                  top: notch,
                  left: 0,
                  right: 0,
                  child: const Center(
                      child: Text(
                        "Bookings",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorList.black,
                            fontSize: 25),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children:  [
                statusStage(),
                Container(
                  margin: const EdgeInsets.all(10),
                    child: selectedButton == "Upcoming" ? currentBookingUpcoming() : selectedButton == "Complete" ? currentBookingComplete() : currentBookingCancel()),
                const SizedBox(height: 100,)
                // _timePicker()
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.selectIndex(0);
  }

  Widget statusStage(){
    return  Padding(
      padding: const EdgeInsets.all(2.0),
      child: GroupButton(
        controller: controller,
        options: GroupButtonOptions(
          selectedShadow: const [],
          selectedTextStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorList.white,
              fontSize: 13
          ),
          selectedColor: ColorList.black,
          unselectedShadow: const [],
          unselectedColor: ColorList.black.withOpacity(.0),
          unselectedTextStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorList.navy,
              fontSize: 13
          ),
          selectedBorderColor: ColorList.black,
          unselectedBorderColor:  ColorList.black.withOpacity(.0),
          borderRadius: BorderRadius.circular(10),
          spacing: 10,
          runSpacing: 1,
          groupingType: GroupingType.row,
          direction: Axis.horizontal,
          buttonHeight: 35,
          buttonWidth: 90,
          mainGroupAlignment: MainGroupAlignment.center,
          crossGroupAlignment: CrossGroupAlignment.center,
          groupRunAlignment: GroupRunAlignment.center,
          textAlign: TextAlign.center,
          textPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          elevation: 0,
        ),
        isRadio: true,
        onSelected: (button, index, isSelected) {
          print('$index button is selected');
          print('$button button is selected');

          setState(() {
             selectedButton = button;
          });

        },
        buttons: const ["Upcoming","Complete","Cancel"],
      ),
    );
  }

  var selectedButton = "Upcoming";


  Widget currentBookingUpcoming() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorList.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage("images/doctor.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),

                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dr.Muhammed Syahid',
                              style: TextStyle(
                                  color: ColorList.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300)),
                          const Text(
                            'Psychiatrists',
                            style: TextStyle(
                                color: ColorList.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                          scheduleCard(),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: const TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: ColorList.white,
                                    )),
                                TextSpan(
                                    text: ' Kilimani, Kenya',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorList.white,
                                        fontSize: 8)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Container(
                    decoration: BoxDecoration(
                      color: ColorList.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Row(
                    children: [
                      Expanded(child: buttonSchedule()),
                      Expanded(child: buttonCancel())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget currentBookingComplete() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorList.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage("images/doctor.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),

                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dr.Muhammed Syahid',
                              style: TextStyle(
                                  color: ColorList.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300)),
                          const Text(
                            'Psychologists',
                            style: TextStyle(
                                color: ColorList.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                          scheduleCard(),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: const TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: ColorList.white,
                                    )),
                                TextSpan(
                                    text: ' Kilimani, Kenya',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorList.white,
                                        fontSize: 8)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Container(
                    decoration: BoxDecoration(
                      color: ColorList.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Row(
                    children: [
                      Expanded(child: buttonBookAgain()),
                      Expanded(child: buttonRate())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget currentBookingCancel() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorList.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage("images/doctor.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),

                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dr.Muhammed Syahid',
                              style: TextStyle(
                                  color: ColorList.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300)),
                          const Text(
                            'Psychologists',
                            style: TextStyle(
                                color: ColorList.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                          scheduleCard(),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: const TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: ColorList.white,
                                    )),
                                TextSpan(
                                    text: ' Kilimani, Kenya',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorList.white,
                                        fontSize: 8)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buttonSchedule() {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: Reschedule(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideRight,
        );
      },
      child: Container(
        height: 35,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorList.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Reschedule',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorList.navy,
              fontSize: 13
          ),
        ),
      ),
    );
  }
  Widget buttonCancel() {
    return InkWell(
      onTap: () {
        _gKey.currentState?.showBottomSheet((context) {
          return const CancelWidget();
        });
      },
      child: Container(
        height: 35,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorList.white.withOpacity(.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Cancel',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorList.navy,
              fontSize: 13
          ),
        ),
      ),
    );
  }

  Widget buttonBookAgain() {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: Book(title : "Schedule Booking"),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideRight,
        );
      },
      child: Container(
        height: 35,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorList.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Book again',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorList.navy,
              fontSize: 13
          ),
        ),
      ),
    );
  }
  Widget buttonRate() {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen:  Review(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideRight,
        );
      },
      child: Container(
        height: 35,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorList.white.withOpacity(.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Leave a review',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorList.navy,
              fontSize: 13
          ),
        ),
      ),
    );
  }

  Widget scheduleCard() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: ColorList.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today,
            color: ColorList.navy,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, December 29',
            style: TextStyle(
                color: ColorList.navy,
                fontSize: 9,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: ColorList.navy,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(
                  color: ColorList.navy,
                  fontSize: 9,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }


  final controller = GroupButtonController();
}
