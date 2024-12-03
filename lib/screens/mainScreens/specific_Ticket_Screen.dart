import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Ticket.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/TrainCardRowInfo.dart';

class speceficTicketScreen extends StatelessWidget {
  const speceficTicketScreen({super.key, required this.ticket});

final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(


      appBar: AppBar(),

      body: SafeArea(
        child: Column(
        
          children: [
        
            // barcode Image 
              Center(
                child: SizedBox(
                  height: 300,
                  width: 350,
                  child: Image.asset(
                    "lib/Images/barcode.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const Divider(color: Colors.grey,thickness: 1,),
        
        
            //Trip info
              TrainCardRowInfo(
              label: "Train id", 
              value: ticket.trainId.toString(),

              labelFontSize: 18,
              valueFontSize: 26,
              ),
              const SizedBox(height: 5,),
              const Divider(color: Colors.grey,thickness: 1,),

              TrainCardRowInfo(
              label: "From", 
              value: ticket.trainOriginCity,

              labelFontSize: 18,
              valueFontSize: 22,
              ),
              const SizedBox(height: 10,),

              TrainCardRowInfo(
              label: "To", 
              value: ticket.trainDestinationCity,

              labelFontSize: 18,
              valueFontSize: 22,
              ),

              const SizedBox(height: 5,),
              const Divider(color: Colors.grey,thickness: 1,),

              TrainCardRowInfo(
              label: "Date", 
              value: ticket.trainDepartureDate,

              labelFontSize: 18,
              valueFontSize: 22,
              ),

              const SizedBox(height: 5,),
              const Divider(color: Colors.grey,thickness: 1,),

              TrainCardRowInfo(
              label: "Name", 
              value: "${ticket.passengarLname}- ${ticket.passengarFname}",

              labelFontSize: 18,
              valueFontSize: 22,
              ),
              
              TrainCardRowInfo(
              label: "Seat", 
              value: "${ticket.seatNumber} Class-${ticket.seatClass}",

              labelFontSize: 18,
              valueFontSize: 22,
              ),
              const Divider(color: Colors.grey,thickness: 1,),

              const Expanded(child: SizedBox()),
              

              TrainCardRowInfo(
              label: "Ticket Price", 
              value: ticket.ticketPrice,
              
              labelFontSize: 20,
              valueFontSize: 35,

              valueColor: Colors.red.shade700,
              ),

              const SizedBox(height:10 ,)
          ],
        ),
      ),

    );
  }
}