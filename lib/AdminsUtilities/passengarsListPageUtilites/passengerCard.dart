import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/PassengarSetsPage.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/TrainCardRowInfo.dart';

class passengarCard extends StatelessWidget {
  const passengarCard({super.key, required this.train, required this.passengar});

  final Train train;
  final Passengar passengar;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),

      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>passengarSeatsPage(train: train,passengar: passengar,)));
        },
        child: Container(
          width: 300,
          height: 100,
          
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(
              color: Colors.black,
              width: 2
            )
          ),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        
            children: [
        
              // Passenger Name
        
              TrainCardRowInfo(
                label: "Name", 
                value: "${passengar.lName} - ${passengar.fName}"
                ),
                const SizedBox(height: 12,),
        
              // number of tickets
        
              TrainCardRowInfo(
                label: "Number of Tickets", 
                value: passengar.passengarTicketsList!.length.toString()
                ),
        
              
            ],
          ),
        ),
      ),
    );
  }
}