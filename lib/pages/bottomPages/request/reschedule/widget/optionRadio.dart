import 'package:champe/resource/color.dart';
import 'package:flutter/material.dart';
class OptionRadio extends StatefulWidget {
  final String text;
  final int index;
  final int selectedButton;
  final Function press;

  const OptionRadio({super.key,
    required this.text,
    required this.index,
    required this.selectedButton,
    required this.press,
  });

  @override
  OptionRadioPage createState() => OptionRadioPage();
}

class OptionRadioPage extends State<OptionRadio> {

  int id = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press(widget.index);
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                  unselectedWidgetColor: ColorList.black,
                  disabledColor: ColorList.black),
              child: Container(
                padding: const EdgeInsets.all( 1),
                margin: const EdgeInsets.only( top: 5,left: 10,right: 10),
                child: RadioListTile(
                  title: Text(
                    widget.text,
                    style:  const TextStyle(color: ColorList.black, fontSize: 14,fontWeight: FontWeight.w300),
                    softWrap: true,
                  ),
                  /*Here the selectedButton which is null initially takes place of value after onChanged. Now, I need to clear the selected button when other button is clicked */
                  groupValue: widget.selectedButton,
                  value: widget.index,
                  activeColor: ColorList.purple,
                  onChanged: (val) async {
                    widget.press(widget.index);
                  },
                  toggleable: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}