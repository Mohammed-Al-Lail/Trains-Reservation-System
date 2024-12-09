import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/AdminsHomePageUtilites/AdminOptionBox.dart';
import 'package:trains_reservation_app_ics321_project/Services/adminProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/AdminHomePage.dart';
import 'package:trains_reservation_app_ics321_project/screens/AdminsScreens/trainPassengersList.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/loginPageUtilites/logInTextField.dart';

class trainAdminsOptionsPage extends StatefulWidget {
   trainAdminsOptionsPage({super.key, required this.train});

  final Train train;

  @override
  State<trainAdminsOptionsPage> createState() => _trainAdminsOptionsPageState();
}

class _trainAdminsOptionsPageState extends State<trainAdminsOptionsPage> {

  final  _driverNameController = TextEditingController();

  // method to add driver for the train
    void addDriverMethod(BuildContext ctx){

      showDialog(

        context: ctx, 
        builder: (context) {
          
          return AlertDialog(

            backgroundColor: Colors.blueGrey[100],
            title: const Text(
              "Enter Driver Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [

              logInTextField(
                controller: _driverNameController, 
                hintText: "Driver name", 
                obscureText: false
                ),
                const SizedBox(height: 10,),

                Center(
                  child: MyElevatedButton(
                    title: "Add", 
                    onPressed: (){
                      
                      if(_driverNameController.text!="" && _driverNameController.text.length>2){

                        widget.train.addDriver(_driverNameController.text);
                        _driverNameController.clear();

                        Navigator.pushAndRemoveUntil(
                          context, 
                          MaterialPageRoute(builder: (context)=>AdminHomePage(admin: Provider.of<AdminProvider>(context).getAdmin!)), 
                          (route) {
                           return route.isFirst ; 
                          },
                          );
                      }
                    }
                    ),
                )
            ],


          );
        },
        
        );
    }


// method to show avg load factor 
  void showAvgLoadFactorMethod(BuildContext ctx){

    showDialog(
      context: context, 
      builder: (context) {
        
        return AlertDialog(

          backgroundColor: Colors.blueGrey[100],
          title:  Text(
              "The Average Load Factor for ${widget.train.englishTainName} is",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),

            actions: [
              Center(
                child: Text(
               widget.train.getAverageLoadFactor(),
                style:  TextStyle(
                  color: Colors.red[600],
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
                            ),
              ),
            ],
        );
      },
      );
  }


// ---------------------------------- Build method -------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.blueGrey[800],

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        
          children: [
            
        
             Text(
              "Select One Option To do",
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 22,
                fontWeight: FontWeight.w900
              ),
            ),
        
             Center(
               child: Text(
                widget.train.englishTainName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900
                ),
                         ),
             ),
            const SizedBox(height: 80,),
        
            optionBox(
              numberOfOption: 1,
              title: "Show Passengars List", 
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>trainPassengarsList(train: widget.train,)));
              }
              ),
        
              optionBox(
              numberOfOption: 2,
              title: "Assigne Driver", 
              onTap: (){
                addDriverMethod(context);
              }
              ),
        
              optionBox(
              numberOfOption: 3,
              title: "promote wait list passengers", 
              onTap: (){}
              ),


              optionBox(
              numberOfOption: 4,
              title: "Average load factor", 
              onTap: (){
                showAvgLoadFactorMethod(context);
              }
              ),
          ],
        ),
      ),
    );
  }
}