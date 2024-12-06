import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/admin.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';

class AdminProvider extends ChangeNotifier{

  
  // method to signIn

bool signInMethod(String email , String password){

  if(allAdminsMap.containsKey(email) ){

    if(allAdminsMap[email]!.passowrd == password){

      _admin =allAdminsMap[email]!; // {initilizing} the Passenger object {which is defined below as late} if the user sign in

      return true;
    }
  }

  return false;
}

// method to reset the Passenger object
  void resetAdminObject(){
    _admin = null ;
  }


// method to delet seat from the user 
  void deletSeat(Seat seat,Passengar passengar){

    passengar.passengarSeatsList.remove(seat); //remove the seat from the spassengar seats list
    seat.isClicked=false;
    seat.isReseived=false;

    int indexOfTheAssosiatedTicket= passengar.passengarTicketsList!.indexWhere( // to get the index of the assosiated ticket with the deleted seat
      (element) => element.seatNumber == seat.seatNumber,
    );
    passengar.passengarTicketsList!.removeAt(indexOfTheAssosiatedTicket); // remove the ticket

    notifyListeners();
  }



  // getters

  Admin? get getAdmin => _admin ;
  
// Data

  late Admin? _admin; // will be defined later when the user logIn

  // data
  // Map of all users who have accounts on the app
  Map< String ,Admin > allAdminsMap = {

   "admin1@gmail.com" :Admin(fName: "Ali", lName: "Al Salem", email: "admin1@gmail.com", passowrd: "54321"),
   "admin2@gmail.com" :Admin(fName: "Hussain", lName: "Al hussain", email: "admin2@gmail.com", passowrd: "54321")

  };
}