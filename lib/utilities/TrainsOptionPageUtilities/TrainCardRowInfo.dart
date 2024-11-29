import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrainCardRowInfo extends StatelessWidget {
   TrainCardRowInfo({
    super.key,
    required this.label,
    required this.value,
    // defult values (the user can change these value)
    this.labelColor=Colors.black,
    this.valueColor=Colors.deepPurple,
    this.labelFontSize=12,
    this.valueFontSize=15,
    });

  final String label;
  final String value;
  // unnecessary to use these parameters, since they have defult values, (they can be null)
  Color? labelColor;
  Color? valueColor;
  double? labelFontSize;
  double? valueFontSize;

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
      
          Text(
            "$label:",
            style: TextStyle(
              color: labelColor,
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5,),
      
         Text(
            value,
            style:  TextStyle(
            fontSize: valueFontSize,
            color: valueColor,
            fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

  }
}