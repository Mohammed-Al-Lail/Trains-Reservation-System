import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TicketsPageUtilites/TicketsListViwe.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TicketsPageUtilites/youDontHaveTicketsText.dart';

// ignore: must_be_immutable
class TicketsPage extends StatelessWidget {
   TicketsPage({super.key, required this.passengar});

  Passengar passengar;

  @override
  Widget build(BuildContext context) {

    final myProvider = Provider.of<usersProvider>(context,listen: false); // get instance from user provider

    return myProvider.getPassengar!.passengarTicketsList!.isEmpty? // check if the ticket list empty or not

    const noTicketsAvalableText() // if it was empty
    :
     Column( // if there is tickets
      
      children: [

        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Mr. ",
              style: TextStyle(
                color: Colors.blueGrey[200],
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              ),
              const SizedBox(width: 2,),
          // passengar last name
              Text(
              passengar.lName,
              style: TextStyle(
                color: Colors.blueGrey[200],
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              ),
          ],
        ),

        Text(
          "find Your",
          style: TextStyle(
                color: Colors.blueGrey[200],
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
        ),
        
        Text(
          ".......Tickets.......",
          style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 42,
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 10,),

        // List viwe of the tickets
        TicketsListViwe(ticketsList: Provider.of<usersProvider>(context,listen: true).getPassengar!.passengarTicketsList!) //{we will be sure that there is a passenger and tickets list}
        
        // TicketCard(
        //   ticket: Ticket(
        //     passengarName: "Mohammed Al Lail",
        //     seatClass: "A",
        //     ticketPrice: "50",
        //     trainDepartureDate: "20/4/2024",
        //     trainOriginCity: "Dammam",
        //     trainDestinationCity: "Makkah",
        //     trainId: "2", 

        //   )
        //   )
      ],

    );
  }
}