import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';

class usersProvider extends ChangeNotifier{


// ------------------------------ Methods --------------------------------------


// method to signIn

bool signInMethod(String email , String password){

  if(allPassengarsMap.containsKey(email) ){

    if(allPassengarsMap[email]!.passowrd == password){

      _passengar =allPassengarsMap[email]!; // {initilizing} the Passenger object {which is defined below as late} if the user sign in

      return true;
    }
  }
  return false;
}

// method to reset the Passenger object
  void resetPassengerObject(){
    _passengar = null ;
  }


// method to add the clicked seats into Passengar seat list 
  void addSeatToPassengerList(Passengar p, Seat seat){
    p.passengarSeatsList.add(seat);
    notifyListeners();
  }

  // method to delet the clicked seats into Passengar seat list 
  void deletSeatToPassengerList(Passengar p, Seat seat){
    p.passengarSeatsList.remove(seat);
    notifyListeners();
  }

  // method to find the total price of the seats selected by the passenger
    int getSeatsTotalPrice(Passengar p){
      int totalPrice =0;
      for(Seat seat in p.passengarSeatsList){
        totalPrice+= seat.seatPrice;
        //notifyListeners();
      }
      return totalPrice;
    }

  // method to reset the _totalTicketsPrice to make it = 0 again {if the passenger complete the payment}
    // void recetTotalTicketPrice(){
    //   _totalTicketsPrice = 0;
    //   notifyListeners();
    // } 

// getters

  Passengar? get getPassengar => _passengar ;
  
// Data

  late Passengar? _passengar; // will be defined later when we logIn
  int _totalTicketsPrice=0; // will be used to determine the total tickets price

  Map< String ,Passengar > allPassengarsMap = {

   "alalmoh3404@gmail.com" :Passengar(fName: "Mohammed", lName: "Al Lail", email: "alalmoh3404@gmail.com", passowrd: "12345"),
   "alalmoh10203040@gmail.com" :Passengar(fName: "Mohammed", lName: "Al Hassan", email: "alalmoh10203040@gmail.com", passowrd: "12345")
  };

}