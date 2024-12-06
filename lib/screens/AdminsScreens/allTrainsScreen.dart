import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/adminProvider.dart';
import 'package:trains_reservation_app_ics321_project/Services/trainProvider.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyGridviwe.dart';

class allTrainsScreen extends StatelessWidget {

  const allTrainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trainProvaider=Provider.of<trainProvider>(context,listen: false);
    final adminProvider = Provider.of<AdminProvider>(context,listen: false);

    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.blueGrey[800],
      
      body: MyGridviwe(trainList: trainProvaider.allTrainsList, user:adminProvider.getAdmin! ,),
    );
  }
}