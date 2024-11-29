import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/utilities/bookinSeatsPageUtilities/seatCard.dart';

class allSeatsGridviwe extends StatelessWidget {
  const allSeatsGridviwe({super.key, required this.train});

  final Train train;
 
  @override
  Widget build(BuildContext context) {

    return GridView.builder(

      physics: const NeverScrollableScrollPhysics(), // to prevent the user to scoll throuth the gridviwe itself
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.75

         
        ),
      itemCount: train.trainSeats.length,
       itemBuilder: (context, index) {
         final myProvider=Provider.of<usersProvider>(context,listen: false);

         return seatCard(seat: train.trainSeats[index],train: train,passengar: myProvider.getPassengar!,);
       },
       
       
       );


  }
}