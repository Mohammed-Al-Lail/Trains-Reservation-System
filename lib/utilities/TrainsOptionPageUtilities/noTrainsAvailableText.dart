import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';

class noTrainsAvailableText extends StatelessWidget {
  const noTrainsAvailableText({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "Unfortunatly",
          style: TextStyle(
            color: Colors.pink[400],
            fontSize: 60,
            fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 3,),

        Text(
          "No Train",
          style: TextStyle(
            color: Colors.pink[200],
            fontSize: 40,
            fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 3,),

        Text(
          "Was Found",
          style: TextStyle(
            color: Colors.pink[200],
            fontSize: 40,
            fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 3,),

        Text(
          "Based on Your",
          style: TextStyle(
            color: Colors.pink[200],
            fontSize: 40,
            fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 3,),

        Text(
          "Search Criteria !!",
          style: TextStyle(
            color: Colors.pink[200],
            fontSize: 40,
            fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 3,),

        MyElevatedButton(
          title: "Go Back",
           onPressed: (){
            Navigator.pop(context);
           }
           ),
      ],
    );
  }
}