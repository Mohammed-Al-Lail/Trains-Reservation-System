import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/user.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/spesefic_Train_Screen.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/TrainCardRowInfo.dart';

class TrainCard extends StatelessWidget {
  const TrainCard({super.key, required this.train,required this.user});

  final Train train;
  final User user;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>speseficTrainScreen(train: train, user:user,)));
        },
        child: Container(
        
          height: 200,
          width: 200,
        
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(8),
          ),
        
          child: Column(
        
            children: [
        
              const SizedBox(height: 5,), 
              
              // for train name (english , arabic) 
              Padding(
                padding: const EdgeInsets.only(left: 2 , right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                
                    // English name
                    Text(
                      train.englishTainName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                
                    const SizedBox(width: 10,),
                
                    // for arabic name
                    Text(
                      train.arabicTainName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Divider(color: Colors.grey[700],thickness: 1.5),
        
        
              // for train id 
              TrainCardRowInfo(label: "Train id", value: train.trainID.toString()),
              const SizedBox(height: 10,),
        
        
              //for train origin city 
              TrainCardRowInfo(label: "From", value: train.originCity),
              const SizedBox(height: 10,),
        
              //for train distination city 
              TrainCardRowInfo(label: "To", value: train.destinationCity),
              const SizedBox(height: 10,),
        
              
        
              // for train departue date
                TrainCardRowInfo(label: "Date", value: train.departureDate.toLocal().toString().split(" ")[0]),
              
        
            ],
          ),
        ),
      ),
    );

  }
}