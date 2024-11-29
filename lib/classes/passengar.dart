import 'package:trains_reservation_app_ics321_project/classes/Ticket.dart';
import 'package:trains_reservation_app_ics321_project/classes/seat.dart';

class Passengar {

Passengar({
  required this.fName, 
  required this.lName,
  required this.email,
  required this.passowrd,
  this. age
});


  final String fName ;
  final String lName;
  final String email;
  final String passowrd;
  String? age;
  List<Ticket>? passengarTicketsList =[];
  List<Seat> passengarSeatsList = [];

}