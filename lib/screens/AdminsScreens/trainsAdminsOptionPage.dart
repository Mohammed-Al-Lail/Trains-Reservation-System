import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/AdminsHomePageUtilites/AdminOptionBox.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/trainPassengersList.dart';

class trainAdminsOptionsPage extends StatelessWidget {
  const trainAdminsOptionsPage({super.key, required this.train});

  final Train train;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.blueGrey[800],

      body: Column(

        children: [
          

           Text(
            "Select One Option To do",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 22,
              fontWeight: FontWeight.w900
            ),
          ),

           Center(
             child: Text(
              train.englishTainName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.w900
              ),
                       ),
           ),
          const SizedBox(height: 80,),

          optionBox(
            numberOfOption: 1,
            title: "Show Passengars List", 
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>trainPassengarsList(train: train,)));
            }
            ),

            optionBox(
            numberOfOption: 2,
            title: "Assigne Driver", 
            onTap: (){}
            ),

            optionBox(
            numberOfOption: 3,
            title: "promote wait list passengers", 
            onTap: (){}
            ),
        ],
      ),
    );
  }
}