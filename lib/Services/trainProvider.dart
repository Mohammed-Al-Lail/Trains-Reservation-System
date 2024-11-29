import 'package:flutter/material.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';

class trainProvider extends ChangeNotifier{


// ---------------- METHODS --------------------------
  

// method to find the total price 
    int findTotalPrice(Train train){
      int totalTicketPrice=0;
      
      for(Seat seat in train.trainSeats){
      if(seat.isClicked!){
        totalTicketPrice += seat.seatPrice;
      }
        
      }
      notifyListeners();
      return totalTicketPrice;
    }


  // method to fillter the trains (for search button)
    void fillterTrains(String originCity , String destinationCity){

      _fillteredTrains.clear(); // reset the list
      
      for(Train t in _allTrainsList){
        if(t.originCity ==originCity && t.destinationCity==destinationCity){
          if( ! _fillteredTrains.contains(t)){
              _fillteredTrains.add(t);
              notifyListeners();
          }
          
        }
      }
    }

  // method for payment button 
    void payButtonMethod(Train train){

      for(Seat seat in train.trainSeats){
        if(seat.isClicked!){
            seat.isReseived =true;
        }
      }
    }

  // getters
    List<Train> get allTrainsList => _allTrainsList;
    List<Train> get fillteredTrains => _fillteredTrains;

  // Data 
    final List <Train> _allTrainsList = [


  Train(
    trainID: 108,
    englishTainName: "Train 1",
    arabicTainName: "قطار 1",
    originCity: "Dammam",
    destinationCity: "Makkah",
    departureDate: "2024 / 12 / 6"
    ),

    Train(
    trainID: 231,
    englishTainName: "Train 2",
    arabicTainName: "قطار 2",
    originCity: "Jeddah",
    destinationCity: "Maddinah",
    departureDate: "2024 / 12 / 9"
    ),

    Train(
    trainID: 411,
    englishTainName: "Train 3",
    arabicTainName: "قطار 3",
    originCity: "Maddinah",
    destinationCity: "Makkah",
    departureDate: "2024 / 12 / 7"
    ),

    Train(
    trainID: 108,
    englishTainName: "Train 4",
    arabicTainName: "قطار4",
    originCity: "Dammam",
    destinationCity: "Makkah",
    departureDate: "2024 / 12 / 6"
    ),

    Train(
    trainID: 108,
    englishTainName: "Train 5",
    arabicTainName: "قطار 5",
    originCity: "Dammam",
    destinationCity: "Makkah",
    departureDate: "2024 / 12 / 6"
    ),

    Train(
    trainID: 108,
    englishTainName: "Train 6",
    arabicTainName: "قطار 6",
    originCity: "Dammam",
    destinationCity: "Makkah",
    departureDate: "2024 / 12 / 6"
    ),

    Train(
    trainID: 108,
    englishTainName: "Train 7",
    arabicTainName: "قطار 7",
    originCity: "Dammam",
    destinationCity: "Makkah",
    departureDate: "2024 / 12 / 6"
    ),
];

List<Train> _fillteredTrains = [];


}