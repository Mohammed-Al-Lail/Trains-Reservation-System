import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Ticket.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/specific_Ticket_Screen.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/TrainCardRowInfo.dart';

// ignore: must_be_immutable
class TicketCard extends StatelessWidget {
   TicketCard({super.key, required this.ticket});

  Ticket ticket;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> speceficTicketScreen(ticket: ticket,)));
      },
      child: Container(
      
        width: 400,
        height: 195,
        margin: const EdgeInsets.all(5),
        decoration:  BoxDecoration(
          color: Colors.white,
      
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16)
          ),
          border: Border.all(
            color: Colors.black,
            width: 4
          )
        ),
      
        child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 15),
      
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            
                //passengar info colunm
            
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
                      TrainCardRowInfo(
                        label: "Train ID",
                        value: ticket.trainId.toString(),
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Origin City",
                        value: ticket.trainOriginCity,
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Desination City",
                        value: ticket.trainDestinationCity,
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Date",
                        value: ticket.trainDepartureDate,
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Name",
                        value: "${ticket.passengarLname} - ${ticket.passengarFname}",
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Seat Number",
                        value: ticket.seatNumber,
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Seat Class",
                        value: ticket.seatClass,
            
                        labelFontSize: 14,
                        valueFontSize: 16,
                         ),
            
                      TrainCardRowInfo(
                        label: "Total Price",
                        value: ticket.ticketPrice,
            
                        labelFontSize: 14,
                        valueFontSize: 16,
            
                         ),
            
                    ],
                  ),
                const SizedBox(width: 5,),
                VerticalDivider( // This is as the same devider , but it is vertical devider 
                  color: Colors.grey[400],
                  thickness: 3,
                ),
                const SizedBox(width: 12,),
              
               // barcode Image 
               SizedBox(
                width: 150,
                height: 170,
                
                 child: Image.asset(
                  "lib/Images/barcode.png",
                  fit: BoxFit.cover,
                  ),
               )
            
              ],
              
            
            
            ),
          ),
        ),
      
        
      ),
    );


  }
}