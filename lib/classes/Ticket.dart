class Ticket{

  Ticket({ // constructor
    required this.trainId,
    required this.passengarFname,
    required this.passengarLname,
    required this.seatClass,
    required this.seatNumber,
    required this.ticketPrice,
    required this.trainOriginCity,
    required this.trainDestinationCity,
    required this.trainDepartureDate,

  });
// required parameters
  final int trainId;
  final String passengarFname;
  final String passengarLname;
  final String seatClass;
  final String seatNumber;
  final String ticketPrice;
  final String trainOriginCity;
  final String trainDestinationCity;
  final String trainDepartureDate;
  
}