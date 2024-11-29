class Seat {

Seat({

  required this.seatNumber,
  required this.seatPrice,
  required this.seatClass,
  this.isClicked=false, // defult value
  this.isReseived =false,
});

  final String seatNumber;
  final int seatPrice;
  final String seatClass;
  bool? isReseived;
  bool? isClicked;
}