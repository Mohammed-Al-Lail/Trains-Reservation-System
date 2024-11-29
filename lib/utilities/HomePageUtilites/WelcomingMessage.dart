import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';

class welcomingMessage extends StatelessWidget {
  const welcomingMessage({super.key, required this.passengar});

  final Passengar? passengar;
  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Hello Mr. ",
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              ),
              const SizedBox(width: 2,),
          // passengar last name
              Text(
              passengar!.lName,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
              ),
              const SizedBox(width: 5,),

          // welcom image 
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "lib/Images/welcom.webp",
                fit: BoxFit.cover,
                ),
            ),
          ],

        ),
        const SizedBox(height: 2,),


         Text(
          "Search for your Trip Now !!",
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 28,
                fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10,),

        // Train image 
            Container(
              height: 180,
              width: 350,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Image.asset(
                "lib/Images/train.webp",
                fit: BoxFit.cover,
                ),
            )


      ],
    );

  }
}