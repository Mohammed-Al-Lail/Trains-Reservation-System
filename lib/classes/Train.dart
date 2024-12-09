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
    this.drivarName
   
  });
  // class fields
  final int trainID;
  final String englishTainName ;
  final String arabicTainName ;
  DateTime departureDate;
  String originCity;
  String destinationCity;
  
  String? drivarName;

  
// Data
  final List<Passengar> _passengarsList=[];

  
  final List<Seat> trainSeats = [ // each train will have fixed number of seats from the begining {every time we creat new train object , by defult it will have this seats list}

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

// geters
  List<Passengar> get passengarsList => _passengarsList;


// method to add passengar to the train passengar list
  void addPassenger(Passengar p){

    if(! _passengarsList.contains(p)){
      _passengarsList.add(p);
    }
  }


  // method to add driver name to the train 
    void addDriver(String name){
      drivarName = name;
    }

 // method to remove driver 
  void deletDriver(){
    drivarName=null ;
  }


// method to find the Average load factor
  String getAverageLoadFactor(){
    double occupiedSeats=0;
    double totalSeats=16;


    for (Seat seat in trainSeats){
      if(seat.isReseived!){
        occupiedSeats++;
      }
    } 

    double avgLoadFactor =  (occupiedSeats / totalSeats) * 100 ;
    return "$avgLoadFactor %";


  }

  
}






