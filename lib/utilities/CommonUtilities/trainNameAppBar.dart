import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';

// ignore: must_be_immutable
class trainNameAppBar extends StatelessWidget {
   trainNameAppBar({super.key,required this.train, required this.onPressed});

  final Train train;
  void Function()? onPressed;
  
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
          onPressed: onPressed,
           icon:  const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 45,
           )
           ),
      );
  }
}