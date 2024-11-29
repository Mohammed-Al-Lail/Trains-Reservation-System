class Ticket{

  Ticket({ // constructor
    required this.passengarName,
    required this.seatClass,
    required this.ticketPrice,
    required this.trainOriginCity,
    required this.trainDestinationCity,
    required this.trainDepartureDate,

  });
// required parameters

  final String passengarName;
  final String seatClass;
  final String ticketPrice;
  final String trainOriginCity;
  final String trainDestinationCity;
  final String trainDepartureDate;
  
}