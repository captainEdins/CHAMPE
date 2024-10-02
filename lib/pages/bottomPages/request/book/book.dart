import 'package:champe/dialog/dialogGood.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';

class Book extends StatefulWidget {
  String title;
   Book({Key? key, required this.title}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {

  late String datePicked = "";
  late String timePicked = "";

  final DatePickerController _controller = DatePickerController();

  DateTime selectedValue = DateTime.now();


  final _defaultTimeRange = TimeRangeResult(
    const TimeOfDay(hour: 14, minute: 50),
    const TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
  }

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
                height: notch == 10 ? 48 : 80,
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
                           Text(
                            widget.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorList.black,
                                fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 90,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: ColorList.black,
                      selectedTextColor: ColorList.white,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          selectedValue = date;
                          print(selectedValue);
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10,bottom: 10),
                      child: Text('Available Time',
                          style: TextStyle(
                              color: ColorList.navy,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    timeRangeState(),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10,bottom: 10),
                      child: Text('Patient Details',
                          style: TextStyle(
                              color: ColorList.navy,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    patient(),
                    //selectedValuePatient
                    Visibility(
                      visible: selectedValuePatient == null ? false : selectedValuePatient == "Me" ? false : true,
                      child: Column(
                        children: [
                          inputName(),
                          ageBracket(),
                          gender(),
                        ],
                      ),
                    ),
                    location(),
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
                  color: ColorList.black,
                ),
              )),
          Positioned(
              bottom: 10,
              right: 35,
              left: 35,
              child: InkWell(
                onTap: () {

                  takeMessage = 'Success!';
                  var textMessage = '${widget.title} Successful!';


                  showAlertDialogGood(textMessage!,buttonOk(),takeMessage);
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
                      'Make Appointment',
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

  final controller = GroupButtonController();
  TextEditingController getName = TextEditingController();
  TextEditingController getComment = TextEditingController();


  String get name => getName.text.trim();
  String get comment => getComment.text.trim();



  final List<String> genderItems = [
    'Male',
    'Female',
    'Other',
  ];

  final List<String> locationItems = [
    'Virtual',
    'Onsite',
  ];


  final List<String> patientItems = [
    'Me',
    'Other',
  ];

  Widget patient(){
    return Padding(
      padding: const EdgeInsets.only(top: 1, left: 15, right: 15),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: const EdgeInsets.all(2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,
        hint: const Text(
          'Apply For ?',
          style: TextStyle( color: ColorList.navy,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorList.navy,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: patientItems
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  const Text(
                    "Apply for",
                    style: TextStyle(
                        color: ColorList.navy,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    item,
                    style: const TextStyle(
                        color: ColorList.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ],
              ),
            ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select application for.';
          }
        },
        onChanged: (value) {
          setState(() {
            print("selectedValuePatient");
            selectedValuePatient = value.toString();
          });
        },
        onSaved: (value) {
          setState(() {
            print(selectedValuePatient);
            selectedValuePatient = value.toString();
          });
        },
      ),
    );
  }
  Widget location(){
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: const EdgeInsets.all(2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,
        hint: const Text(
          'Select Location',
          style: TextStyle( color: ColorList.navy,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorList.navy,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: locationItems
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  const Text(
                    "Location",
                    style: TextStyle(
                        color: ColorList.navy,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    item,
                    style: const TextStyle(
                        color: ColorList.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ],
              ),
            ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select location.';
          }
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {
          setState(() {
            selectedValueLocation = value.toString();
          });
        },
      ),
    );
  }
  Widget gender(){
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: const EdgeInsets.all(2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,
        hint: const Text(
          'Gender',
          style: TextStyle( color: ColorList.navy,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorList.navy,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: genderItems
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(
                        color: ColorList.navy,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    item,
                    style: const TextStyle(
                        color: ColorList.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ],
              ),
            ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {
          setState(() {
            selectedValueGender = value.toString();
          });
        },
      ),
    );
  }
  Widget ageBracket(){
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: const EdgeInsets.all(2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: ColorList.black.withOpacity(.3),
              )
          ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,
        hint: const Text(
          'Age',
          style: TextStyle( color: ColorList.navy,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorList.navy,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: getAgeSlot()
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  const Text(
                    "Age",
                    style: TextStyle(
                        color: ColorList.navy,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    item,
                    style: const TextStyle(
                        color: ColorList.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ],
              ),
            ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select age.';
          }
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {
          setState(() {
            selectedValueAge = value.toString();
          });
        },
      ),
    );
  }

  String? selectedValueGender;
  String? selectedValueLocation;
  String? selectedValuePatient;
  String? selectedValueAge;

  Widget inputName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              cursorColor: ColorList.navy.withOpacity(.5),
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  color: ColorList.navy,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              controller: getName,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: ColorList.navy,
                hintText: 'Patient name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorList.black.withOpacity(.3),
                  ), //<-- SEE HERE
                ),
                hintStyle: const TextStyle(
                    color: ColorList.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                labelStyle: const TextStyle(
                    color: ColorList.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 1, color: ColorList.black.withOpacity(.3)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget inputComment() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              cursorColor: ColorList.navy.withOpacity(.5),
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  color: ColorList.navy,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              controller: getComment,
              maxLines: 5,
              maxLength: 350,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: ColorList.navy,
                hintText: 'Your problem',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorList.black.withOpacity(.3),
                  ), //<-- SEE HERE
                ),
                hintStyle: const TextStyle(
                    color: ColorList.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                labelStyle: const TextStyle(
                    color: ColorList.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 1, color: ColorList.black.withOpacity(.3)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget timeRangeState(){
    return  GroupButton(
      controller: controller,
      options: GroupButtonOptions(
        selectedShadow: const [],
        selectedTextStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            color: ColorList.white,
            fontSize: 14
        ),
        selectedColor: ColorList.black,
        unselectedShadow: const [],
        unselectedColor: ColorList.white,
        unselectedTextStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            color: ColorList.navy,
            fontSize: 14
        ),
        selectedBorderColor: ColorList.black,
        unselectedBorderColor: ColorList.navy.withOpacity(.4),
        borderRadius: BorderRadius.circular(10),
        spacing: 10,
        runSpacing: 10,
        groupingType: GroupingType.wrap,
        direction: Axis.horizontal,
        buttonHeight: 35,
        buttonWidth: 70,
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
         // selectedButton = button;
        });

      },
      buttons: getTimeSlot(),
    );
  }

  List<String> getTimeSlot(){



    DateTime now = DateTime.now();

    var hour = 7;


    if(selectedValue.day == now.day && selectedValue.month == now.month && selectedValue.year == now.year){
      if(now.minute > 21){
        hour = now.hour + 1;
      }else{
        hour = now.hour;
      }
    }


    DateTime startTime = DateTime(now.year, now.month, now.day, hour, 0, 0);
    DateTime endTime = DateTime(now.year, now.month, now.day, 22, 0, 0);
    Duration step = const Duration(minutes: 30);
    Duration stepFirst = const Duration(minutes: 0);

    List<String> timeSlots = [];

    var count = 1;


    if(selectedValue.day == now.day && selectedValue.month == now.month && selectedValue.year == now.year){
      if(now.minute > 51){
        count = 2;
      }
    }

    while(startTime.isBefore(endTime)) {

      DateTime timeIncrement = startTime.add(count == 1 ? stepFirst : step);
      timeSlots.add(DateFormat.Hm().format(timeIncrement));
      startTime = timeIncrement;

      count++;
    }

    return timeSlots;
  }
  List<String> getAgeSlot(){
    var age  = 0;
    List<String> ageSlots = [];



    while(age < 150) {

      var newAge = age + 10;
      ageSlots.add("$age - $newAge");

      age = age + 10;
    }

    return ageSlots;
  }

Widget timeRange(){
    return  TimeRange(
      fromTitle: const Text(
        'FROM',
        style: TextStyle(
          fontSize: 14,
          color: ColorList.navy,
          fontWeight: FontWeight.w600,
        ),
      ),
      toTitle: const Text(
        'TO',
        style: TextStyle(
          fontSize: 14,
          color: ColorList.navy,
          fontWeight: FontWeight.w600,
        ),
      ),
      titlePadding: 20,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        color: ColorList.navy,
          fontSize: 14
      ),
      activeTextStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        color: ColorList.white,
        fontSize: 14
      ),
      borderColor: ColorList.navy.withOpacity(.4),
      activeBorderColor: ColorList.black,
      backgroundColor: Colors.transparent,
      activeBackgroundColor: ColorList.black,
      firstTime: const TimeOfDay(hour: 8, minute: 00),
      lastTime: const TimeOfDay(hour: 20, minute: 00),
      initialRange: _timeRange,
      timeStep: 10,
      timeBlock: 30,
      onRangeCompleted: (range) => setState(() => _timeRange = range),
    );
}


  var takeMessage = '';
  Widget buttonOk() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {

              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);

            },
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorList.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'ok',
                style: TextStyle(
                  color: ColorList.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  showAlertDialogGood(String message, Widget buttonOk,String title) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogGood(message: message, title: title,buttons: buttonOk,);
      },
    );
  }

}
