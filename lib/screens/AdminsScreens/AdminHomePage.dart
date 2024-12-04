import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/AdminsHomePageUtilites/AdminOptionBox.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/addNewTrainPage.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/allTrainsScreen.dart';
import 'package:trains_reservation_app_ics321_project/screens/LogInScreen/signin.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.blueGrey[800],
      


      body:  SafeArea(
        child: Column(
        
        
          children: [
        
            const Center(
              child: Text(
                "......Hello Admin......\nSelect One Option",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
            const SizedBox(height: 30,),
            
          // List of options {add new train ,edit train, edit reservations}

             // show all the trains on the system
              optionBox(
                title: "Display all Trains",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>allTrainsScreen()));
                },
                ),
             // add new train to the system  
              optionBox(
                title: "Add new Trains",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddnewTrainPage()));
                },
                ),
             //Edit - cancel reservations
              optionBox(
                title: "Edit reservations",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninPage()));
                },
                ),
              
        
          ],
        ),
      ),
    );
  }
}