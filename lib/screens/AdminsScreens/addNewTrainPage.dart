import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/addNewTrainPageUtilities/addNewTrainForm.dart';

class AddnewTrainPage extends StatelessWidget {
  const AddnewTrainPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.transparent,),

      backgroundColor: Colors.blueGrey[800],

      body:  Column(

        children: [

          // text
          Center(
            child: Text(
              "Fill The Required Information\nTo Add New Train to The System",
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 26,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
          const SizedBox(height: 30,),

          // container to let the admin fill the information
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width* 0.8, // take 70% from the screen size,

              decoration: BoxDecoration(
                color: Colors.blueGrey[100]
              ),

              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: addNewTrainForm()
                ),

            ),

          // add button
        ],
      ),
    );
  }
}