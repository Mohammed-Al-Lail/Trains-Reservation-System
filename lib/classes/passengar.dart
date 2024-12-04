import 'package:trains_reservation_app_ics321_project/classes/Ticket.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';
import 'package:trains_reservation_app_ics321_project/classes/user.dart';

class Passengar extends User{

Passengar({ // we will take the same parameters from the suber class
  required super.fName, 
  required super.lName,
  required super.email,
  required super.passowrd,
  String? age
});


  
  List<Ticket>? passengarTicketsList =[];
  List<Seat> passengarSeatsList = [];

}