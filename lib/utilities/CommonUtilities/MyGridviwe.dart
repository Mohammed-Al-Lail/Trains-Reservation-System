import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/user.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/TrainCard.dart';

class MyGridviwe extends StatelessWidget {
  const MyGridviwe({super.key,required this.trainList,required this.user});

  final List<Train> trainList;
  final User user;
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true, // take the maximum space
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2 ,
        childAspectRatio: 0.85,

        

        ),
        itemCount: trainList.length,
        itemBuilder:(context,index){

        return TrainCard(train: trainList[index], user: user,);
      } ,

      );
  }
}