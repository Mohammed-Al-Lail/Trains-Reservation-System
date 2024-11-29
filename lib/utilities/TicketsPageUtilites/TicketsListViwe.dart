import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Ticket.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TicketsPageUtilites/TicketCard.dart';

// ignore: must_be_immutable
class TicketsListViwe extends StatelessWidget {
   TicketsListViwe({super.key,required this.ticketsList});

  List<Ticket> ticketsList;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      
      child: ListView.builder(
        itemCount: ticketsList.length ,
        itemBuilder: (context, index) {
          return TicketCard(ticket: ticketsList[index]);
        },
      
        
        
        ),
    );

  }
}