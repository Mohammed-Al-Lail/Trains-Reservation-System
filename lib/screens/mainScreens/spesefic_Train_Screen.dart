import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/booking_seats_Screen.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/trainNameAppBar.dart';
import 'package:trains_reservation_app_ics321_project/utilities/HomePageUtilites/MyCircularProgressIndicator.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/TrainCardRowInfo.dart';

class speseficTrainScreen extends StatefulWidget {
   speseficTrainScreen({super.key,required this.train});


  final Train train;  // we must bass a train object to this class

  

  @override
  State<speseficTrainScreen> createState() => _speseficTrainScreenState();
}

class _speseficTrainScreenState extends State<speseficTrainScreen> {

  bool _isLoading = false; // to deterne the statues of the circular indicator
  
  Future<void> _loadData() async {  // we used Future , in case we want to get data from the internet
    setState(() {
      _isLoading = true; // Set loading state to true, to show the indicator
    });

    // Simulate a network call
    await Future.delayed(const Duration(seconds: 3)); // wait here for 7 seconds before goning to the next line


    // After loading is done
    setState(() {
      _isLoading = false; // Set loading state to false after 7 seconds to close the indicator
    });

  // after finithing loading, go to the next page =>(bookingSeatesScreen)
    Navigator.push(context, MaterialPageRoute(builder: (context)=>bookingSeatesScreen(train: widget.train,)));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blueGrey[800],
      

    body: _isLoading? const MyCircularProgressIndicator()
        : Column(
      
      children: [

         // coustomised appbar
            trainNameAppBar(train: widget.train),
            
         const SizedBox(height: 40,),
        // Trip info text
            Center(
              child: Text(
                "....Trip Informations....",
                style: TextStyle(
                  color: Colors.blueGrey.shade200,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Divider(color: Colors.yellow[100],thickness: 1),

        // origin city 
          TrainCardRowInfo(
            label: "Origin City",
            value: widget.train.originCity,

            valueColor: Colors.white,
            labelColor: Colors.grey[400],

            valueFontSize: 30,
            labelFontSize: 20,

             ),
             Divider(color: Colors.yellow[100],thickness: 1),
             const SizedBox(height: 20,),
             

        // destination city
          TrainCardRowInfo(
            label: "Destination City",
            value: widget.train.destinationCity,

            valueColor: Colors.white,
            labelColor: Colors.grey[400],

            valueFontSize: 30,
            labelFontSize: 20,

             ),
             Divider(color: Colors.yellow[100],thickness: 1),
             const SizedBox(height: 20,),

        // date
          TrainCardRowInfo(
            label: "Date",
            value: widget.train.departureDate,

            valueColor: Colors.white,
            labelColor: Colors.grey[400],

            valueFontSize: 30,
            labelFontSize: 20,

             ),
             Divider(color: Colors.yellow[100],thickness: 1),
             const SizedBox(height: 40,),
             

        // Book seats Button
          MyElevatedButton(
            title: "Book Seats",
             onPressed: (){
              _loadData(); // this method will wait for some seconds before going to (bookingSeatesScreen) page
              
             }
             ),
      ],
    ),



    );

  }
}