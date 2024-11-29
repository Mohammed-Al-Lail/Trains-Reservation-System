import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/payment_Screen.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/trainNameAppBar.dart';
import 'package:trains_reservation_app_ics321_project/utilities/bookinSeatsPageUtilities/allSeatsGridViwe.dart';
import 'package:trains_reservation_app_ics321_project/utilities/bookinSeatsPageUtilities/totalPriceRow.dart';
import 'package:trains_reservation_app_ics321_project/utilities/bookinSeatsPageUtilities/trainHead.dart';

// ignore: must_be_immutable
class bookingSeatesScreen extends StatelessWidget {
   bookingSeatesScreen({super.key, required this.train});

  Train train;

  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      backgroundColor: Colors.blueGrey[800],
      
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            // coustomised appbar
            trainNameAppBar(
              train:train,
              onPressed: (){

                Navigator.pop(context);  // close the page
                // reset the clicked seats to the normal state => {isClicke = false}
                Provider.of<usersProvider>(context,listen: false).resetSeatsToUnClicked();
              },
              ),

            const SizedBox(height: 40,),
          // selsect your seat text
              Center(
                child: Text(
                  "....Select your seats....",
                  style: TextStyle(
                    color: Colors.blueGrey.shade200,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 20,),

          //head of the train container
            const trainHead(),

          // container that will hold the seats
            Container(
              height: 550,
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              
              child: Column(
                children: [

                  // all the seats
                  SizedBox(
                    height: 470,
                    child: SingleChildScrollView( 
                      child:  allSeatsGridviwe(train: train),
                      )
                    ),
                 const SizedBox(height: 20,),

                  // total price text
                  
                    totalPriceRow(passenger: Provider.of<usersProvider>(context).getPassengar!),

                      
                ],
              ),

            ), // End of the seats container
            const SizedBox(height: 20,),
        
            // Pay now Button
              MyElevatedButton(
                title: "Pay Now",
                 onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PayScreen(train: train,)));
                 }
                 ),
                 const SizedBox(height: 20,),
        
        
          ],
        ),
      ),
    );
  }
}