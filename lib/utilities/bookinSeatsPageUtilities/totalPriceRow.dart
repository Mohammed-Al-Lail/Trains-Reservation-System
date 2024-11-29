import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';

// ignore: must_be_immutable
class totalPriceRow extends StatefulWidget {

   totalPriceRow({super.key,required this.passenger});

  Passengar passenger;
  @override
  State<totalPriceRow> createState() => _totalPriceRowState();
}

class _totalPriceRowState extends State<totalPriceRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
      
        children: [
      
          Text(
            "Total Price: ",
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 5,),
      
          Text(
            Provider.of<usersProvider>(context,listen: true).getSeatsTotalPrice().toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 2,),

          const Text(
            "SAR",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          
        ],
      ),
    );
  }
}