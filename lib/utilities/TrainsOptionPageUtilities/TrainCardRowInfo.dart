import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrainCardRowInfo extends StatelessWidget {
   TrainCardRowInfo({
    super.key,
    required this.label,
    required this.value,
    // defult values (the user can change these value)
    this.labelColor=const Color.fromRGBO(97, 97, 97, 1),
    this.valueColor=Colors.black,
    this.labelFontSize=12,
    this.valueFontSize=18,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      
          Text(
            "$label:",
            style: TextStyle(
              color: labelColor,
              fontSize: labelFontSize,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 5,),
      
         Text(
            value,
            style:  TextStyle(
            fontSize: valueFontSize,
            color: valueColor,
            fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );

  }
}