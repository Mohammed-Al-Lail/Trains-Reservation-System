import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';

// ignore: must_be_immutable
class seatCard extends StatefulWidget {
   seatCard({super.key, required this.train,required this.seat, required this.passengar});

  Train train;
  Seat seat;
  Passengar passengar;
  

  @override
  State<seatCard> createState() => _seatCardState();
}

class _seatCardState extends State<seatCard> {

  

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Padding(
          padding: const EdgeInsets.all(10),
        
          child: GestureDetector(
            onTap:  widget.seat.isReseived!? null // if the seat was reseirved already
            :
            () { // if the seat was not resirved
            final myProvider = Provider.of<usersProvider>(context,listen: false); // get instance from the user provider

              setState(() {
                widget.seat.isClicked=!widget.seat.isClicked!; // change the state of isClicked
              });
              if(widget.seat.isClicked!){// since each seat  will have a defult value for isClicked, which is false, because of that we add (!) at the end, (which mean we sure it will not be null) 
                myProvider.addSeatToPassengerList(widget.passengar, widget.seat);
                }
                else{
                  myProvider.deletSeatToPassengerList(widget.passengar, widget.seat);
                }
            },
            child: Container(
            
              width: 50,
              height: 50,
              decoration:  BoxDecoration(

                color: widget.seat.isReseived!? Colors.pink[200] // if the seat was reserved
                          : 
                      widget.seat.isClicked!? Colors.green.shade600 // if the seat was not resirced and clicked
                          :  
                          Colors.blueGrey.shade700, // if the seat was not resirved and not clicked

                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            
              child: Center(
                child: Text(
                  widget.seat.seatNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2,),

        // class level text
        Text(
          "Class Level: ${widget.seat.seatClass}",
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w900
          ),
        ),
        //seat price text
        Text(
          "Seat Price: ${widget.seat.seatPrice}",
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w900
          ),
        ),
      ],
    );

  }
}