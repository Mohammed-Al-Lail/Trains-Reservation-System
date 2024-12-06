import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/adminProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';
import 'package:trains_reservation_app_ics321_project/utilities/bookinSeatsPageUtilities/seatCard.dart';

class passengarSeatsGridviwe extends StatelessWidget {
   passengarSeatsGridviwe({super.key, required this.passengar , required this.train});

  final Train train;
  final Passengar passengar;

  


  // method to show dialog to confirm the delation of the seat
    void myDialog(BuildContext ctx, Seat seat){

      showDialog(
        context: ctx, 
        builder: (context) {
          
          return  AlertDialog(
            backgroundColor: Colors.blueGrey[100],
            title:  Text(
              "Are You Sure From\nRemoving Seat ${seat.seatNumber}\nFrom ${passengar.fName} ${passengar.lName}?",
              style: const TextStyle(
                fontWeight: FontWeight.w900
              ),
              ),
            

            actions: [

              
              // yes button
              ElevatedButton(
                onPressed: (){
                  Provider.of<AdminProvider>(context,listen: false).deletSeat(seat, passengar);
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    
                     SnackBar(
                      backgroundColor: Colors.green[900],
                      duration: const Duration(seconds: 3),
                      content: const Center(
                        child: Text(
                          "The seat was deleated Successfully",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20
                          ),
                          ),
                      )
                    )
                  );


                  

                  if(passengar.passengarTicketsList!.isEmpty){ // if we delet all the tickets assosiated with the train
                    train.passengarsList.remove(passengar);
                  }
                  
                },

                style:  ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green[800])
                ), 
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),

                // No button
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(ctx); // close the dialog
                },

                style:  ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red[800])
                ), 
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),

            ],
          );
        },
        );
    }
  @override
  Widget build(BuildContext context) {
   final adminProvider= Provider.of<AdminProvider>(context,listen: false);


    return GridView.builder(
    
      physics: const NeverScrollableScrollPhysics(), // to prevent the user to scoll throuth the gridviwe itself
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        

         
        ),
      itemCount: passengar.passengarSeatsList.length,
       itemBuilder: (context, index) {
        

         return seatCard(
          user: adminProvider.getAdmin!,
          seat: passengar.passengarSeatsList[index],
          train: train,
          onDoubleTap: () {
            myDialog(context, passengar.passengarSeatsList[index]);//adminProvider.deletSeat(passengar.passengarSeatsList[index], passengar);
          },
          
          );
       },
       
       
       );
  }
}