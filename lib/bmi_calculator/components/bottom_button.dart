import 'package:app_brewery_tutorial/bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.title, @required this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: kBottomContainerColour,
        margin: kBottomContainerMargin,
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
