import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/passengarsListPageUtilites/passengarsListViwe.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';

class trainPassengarsList extends StatelessWidget {
  const trainPassengarsList({super.key, required this.train});

  final Train train;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.blueGrey[800],

      body:  train.passengarsList.isNotEmpty?
       Column(

        children: [

          Text(
            "${train.englishTainName} Passengars List",
            style: const TextStyle(
            color: Colors.white,
            fontSize: 26
              ),
            ), 
        passengarsListViwe(train: train,passengarsList: train.passengarsList)
         
           
        ],

      ) 
      
      : // if there were no passengars on this train
      Center(
          child: Text(
            "There is No Passengars\nOn This Train Yet",
            style: TextStyle(
              color: Colors.pink[200],
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          
          ),
        ), 


    );
  }
}