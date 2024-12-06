import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/AdminsHomePageUtilites/AdminOptionBox.dart';
import 'package:trains_reservation_app_ics321_project/Services/adminProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/admin.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/addNewTrainPage.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/allTrainsScreen.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key,required this.admin});

  final Admin admin;
  @override
  Widget build(BuildContext context) {
  final adminProvide=Provider.of<AdminProvider>(context,listen: false);

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          adminProvide.resetAdminObject();
          Navigator.pop(context);
        },
        child: Icon(Icons.logout),
        ),

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
            const SizedBox(height: 80,),
            
          // List of options {add new train ,edit train, edit reservations}

             // add new train to the system  
              optionBox(
                numberOfOption: 1,
                title: "Add new Trains",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddnewTrainPage()));
                },
                ),
             //Edit - cancel reservations
              optionBox(
                numberOfOption: 2,
                title: "Edit reservations",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>allTrainsScreen()));
                },
                ),
              
        
          ],
        ),
      ),
    );
  }
}