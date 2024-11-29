import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyElevatedButton extends StatelessWidget {
   MyElevatedButton({
    super.key,
    required this.title,
    required this.onPressed
    });

  final String title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {

    return SizedBox( // to controll the size of the button
      width: 150,
      child: ElevatedButton(
              onPressed: onPressed ,
               style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade900),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                elevation:const WidgetStatePropertyAll(5),
                shadowColor: const WidgetStatePropertyAll(Colors.white) 
               ),
      
               child:  Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
               ),
               ),
    );
  }
}