import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/passengarsListPageUtilites/passengarSeatsGridviwe.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';


class passengarSeatsPage extends StatelessWidget {
  const passengarSeatsPage({super.key,required this.train ,required this.passengar});

  final Train train;
  final Passengar passengar;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.blueGrey[800],

      body: Column(

      children: [

        Center(
          child: Text(
            "${passengar.fName} - ${passengar.lName} Seats",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ),
        Center(
          child: Text(
            "on ${train.englishTainName}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
        ),

        passengarSeatsGridviwe(passengar: passengar, train: train),
      

        
      ],
    ),
    );
  }
}