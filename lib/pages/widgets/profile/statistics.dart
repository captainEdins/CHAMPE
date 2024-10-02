import 'package:champe/pages/widgets/helper/widgets/headers.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Column(
        children: [
          Headers(title: "Statistics",getBack: true,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                pieChart(),
                topView(),
                topViewMore(),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'This week',
                    style: TextStyle(
                      color: ColorList.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                thisWeek(),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Last week',
                    style: TextStyle(
                      color: ColorList.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                lastWeek(),
                const SizedBox(height: 20,)
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget topViewMore(){
    return Row(
      children: [
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: ColorList.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorList.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.hdr_auto_sharp,
                        size: 24,
                        color: ColorList.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      Text(
                        "20%",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                      Text(
                        "Anxiety",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              decoration: BoxDecoration(
                color: ColorList.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorList.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.slow_motion_video,
                        size: 24,
                        color: ColorList.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "30%",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                      Text(
                        "Motivation",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
  Widget topView(){
    return Row(
      children: [
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: ColorList.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorList.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 24,
                        color: ColorList.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      Text(
                        "10%",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                      Text(
                        "Exam Stress",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              decoration: BoxDecoration(
                color: ColorList.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorList.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.work,
                        size: 24,
                        color: ColorList.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "40%",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                      Text(
                        "Work Stress",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: ColorList.black,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }


  final dataMap = <String, double>{
    "happy": 5,
    "calm": 3,
    "great": 2,
    "good": 2,
    "sad": 2,
    "neutral": 2,
    "angry": 2,
  };


  final colorList = <Color>[
    ColorList.gold.withOpacity(.7),
    ColorList.blue.withOpacity(.7),
    ColorList.violet.withOpacity(.7),
    ColorList.black.withOpacity(.7),
    ColorList.pink.withOpacity(.7),
    ColorList.purple.withOpacity(.7),
    ColorList.greenMain.withOpacity(.7),
  ];

  Widget pieChart(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color: ColorList.black.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Average mood",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                  fontWeight: FontWeight.w100, fontSize: 12),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),
        ],
      ),
    );
  }
  Widget thisWeek(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color: ColorList.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "happy",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.gold.withOpacity(0.6),
                  ColorList.gold.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "calm",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.blue.withOpacity(0.6),
                  ColorList.blue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "great",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.violet.withOpacity(0.6),
                  ColorList.violet.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "good",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.black.withOpacity(0.6),
                  ColorList.black.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "sad",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.pink.withOpacity(0.6),
                  ColorList.pink.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "neutral",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.purple.withOpacity(0.6),
                  ColorList.purple.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "angry",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.greenMain.withOpacity(0.6),
                  ColorList.greenMain.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10,)

        ],
      ),
    );
  }
  Widget lastWeek(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color: ColorList.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "happy",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.gold.withOpacity(0.6),
                  ColorList.gold.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "calm",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.blue.withOpacity(0.6),
                  ColorList.blue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "great",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.violet.withOpacity(0.6),
                  ColorList.violet.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "good",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.black.withOpacity(0.6),
                  ColorList.black.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "sad",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.pink.withOpacity(0.6),
                  ColorList.pink.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "neutral",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.purple.withOpacity(0.6),
                  ColorList.purple.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "angry",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ColorList.black,
                  fontSize: 15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorList.greenMain.withOpacity(0.6),
                  ColorList.greenMain.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10,)

        ],
      ),
    );
  }
}
