import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Ticket.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
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
  void addSeatToPassengerList(Seat seat){
    _passengar!.passengarSeatsList.add(seat);
    notifyListeners();
  }

  // method to delet the clicked seats into Passengar seat list 
  void deletSeatFromPassengerList(Seat seat){
    _passengar!.passengarSeatsList.remove(seat);
    notifyListeners();
  }

  // method to find the total price of the seats selected by the passenger
    int getSeatsTotalPrice(){
      int totalPrice =0;
      for(Seat seat in _passengar!.passengarSeatsList){
        totalPrice+= seat.seatPrice;
        //notifyListeners();
      }
      return totalPrice;
    }

  // method to clear the passenger seats list {it will be used after he complete the payment and he recived the tickets}
    void resetPassengarSeatsList(){
      _passengar!.passengarSeatsList.clear();
      notifyListeners();
    }


    // method to reset the seats to be unclicke, if the page was closed without completting the payment
      void resetSeatsToUnClicked(){

        for(Seat seat in List.from(_passengar!.passengarSeatsList) ){  // List.from(_passengar!.passengarSeatsList) . is another copy list that have the same elements of the orginal passengarSeatsList . {we use it to avoid errors that may happen if we iterate throuht the orginal list and i we delete or add new objects before the iteration finish}

          if(!seat.isReseived! && seat.isClicked!){ // if the seat was not reseived and clicked

            seat.isClicked=false ; // we will make isClicked=false , if the user close the page without completing the payment
            deletSeatFromPassengerList(seat); // the seat will be deleated aoutomatically from the seats list
            notifyListeners(); 
          }
        }
      }


    // methode to create tickets for the passanger {will be invoked only after the payment done}
      void createTickets(Train train){

        for(Seat seat in _passengar!.passengarSeatsList){
          // add  new ticket object to the tickets list for the passengar
          _passengar!.passengarTicketsList!.add(
            Ticket(
              trainId: train.trainID,
              passengarFname: _passengar!.fName, 
              passengarLname: _passengar!.lName, 
              seatClass: seat.seatClass, 
              ticketPrice: seat.seatPrice.toString(), 
              seatNumber: seat.seatNumber,
              trainOriginCity: train.originCity, 
              trainDestinationCity: train.destinationCity, 
              trainDepartureDate: train.departureDate.toLocal().toString().split(" ")[0]
              )

          );
          
        }
        notifyListeners();


      }

// getters

  Passengar? get getPassengar => _passengar ;
  
// Data

  late Passengar? _passengar; // will be defined later when the user logIn
  

  // Map of all users who have accounts on the app
  Map< String ,Passengar > allPassengarsMap = {

   "alalmoh3404@gmail.com" :Passengar(fName: "Mohammed", lName: "Al Lail", email: "alalmoh3404@gmail.com", passowrd: "12345"),
   "alalmoh10203040@gmail.com" :Passengar(fName: "Mohammed", lName: "Al Hassan", email: "alalmoh10203040@gmail.com", passowrd: "12345")
  };

}