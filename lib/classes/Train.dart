import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';

class Train{

  Train({ // constructor

    required this.trainID,
    required this.englishTainName,
    required this.arabicTainName,
    required this.originCity,
    required this.destinationCity, 
    required this.departureDate,
   
  });
  // class fields
  final int trainID;
  final String englishTainName ;
  final String arabicTainName ;
  DateTime departureDate;
  String originCity;
  String destinationCity;

  

  List<Passengar> passengarsList=[];


  List<Seat> trainSeats = [ // each train will have fixed number of seats from the begining

    Seat(
      seatNumber: "1",
       seatPrice: 50,
        seatClass: "A"
        ),

        Seat(
      seatNumber: "2",
       seatPrice: 50,
        seatClass: "A"
        ),

        Seat(
      seatNumber: "3",
       seatPrice: 50,
        seatClass: "A"
        ),

        Seat(
      seatNumber: "4",
       seatPrice: 50,
        seatClass: "A"
        ),

        Seat(
      seatNumber: "5",
       seatPrice: 30,
        seatClass: "B"
        ),

        Seat(
      seatNumber: "6",
       seatPrice: 30,
        seatClass: "B"
        ),

        Seat(
      seatNumber: "7",
       seatPrice: 30,
        seatClass: "B"
        ),

        Seat(
      seatNumber: "8",
       seatPrice: 30,
        seatClass: "B"
        ),

        Seat(
      seatNumber: "9",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "10",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "11",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "12",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "13",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "14",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "15",
       seatPrice: 15,
        seatClass: "C"
        ),
        Seat(
      seatNumber: "16",
       seatPrice: 15,
        seatClass: "C"
        ),

  ];


  
}






