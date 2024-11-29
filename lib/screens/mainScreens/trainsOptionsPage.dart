import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/trainProvider.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyGridviwe.dart';
import 'package:trains_reservation_app_ics321_project/utilities/TrainsOptionPageUtilities/noTrainsAvailableText.dart';


class TrainsOptionsPage extends StatelessWidget {

  const TrainsOptionsPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueGrey[800],
      
      appBar: AppBar(
        title: const Text(
          " Your search results....",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon:  const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 45,
           )
           ),
      ),


      
      body: Provider.of<trainProvider>(context).fillteredTrains.isEmpty? 

      const Center(child: noTrainsAvailableText())

      :  // second option (if there is available trains) 
      
      MyGridviwe(trainList: Provider.of<trainProvider>(context,listen: false).fillteredTrains)
      

    );
  }
}