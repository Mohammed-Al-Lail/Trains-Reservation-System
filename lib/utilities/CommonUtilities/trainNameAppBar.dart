import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';

class trainNameAppBar extends StatelessWidget {
  const trainNameAppBar({super.key,required this.train});

  final Train train;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
          train.englishTainName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),

        Text(
          train.arabicTainName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
          ],
        ),

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon:  const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 45,
           )
           ),
      );
  }
}