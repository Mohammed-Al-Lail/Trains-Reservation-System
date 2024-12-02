import 'package:flutter/material.dart';

// ignore: must_be_immutable
class dateContainer extends StatelessWidget {
   dateContainer({super.key, required this.date});

  String date;
  @override
  Widget build(BuildContext context) {

    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
    
        Text(
        "selected date:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          ),
      ),
      const SizedBox(width: 4,),
    
      Text(
        date,
        style:  TextStyle(
          color: Colors.red.shade600,
          fontSize: 18,
          fontWeight: FontWeight.w900
          ),
      ),
      ],
    );
  }
}