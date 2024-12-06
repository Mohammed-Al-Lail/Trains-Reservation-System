import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/passengarsListPageUtilites/passengerCard.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';

class passengarsListViwe extends StatelessWidget {
  const passengarsListViwe({super.key,required this.train,required this.passengarsList});

 final Train train;
 final List<Passengar> passengarsList;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount: passengarsList.length,
      
        itemBuilder: (context, index) {
          if(passengarsList[index].passengarTicketsList!.isNotEmpty){ // we will show the passengars who have tickets only
            return passengarCard(train: train,passengar: passengarsList[index]);
          }
          return null;
          
        },
        ),
    );
  }
}