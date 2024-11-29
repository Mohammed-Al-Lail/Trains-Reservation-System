import 'package:flutter/material.dart';

// ignore: must_be_immutable
class logInButton extends StatelessWidget {
    logInButton({
    
    super.key,
    required this.buttonText,
    required this.function,
    this.buttonColor = const Color.fromRGBO(144, 164, 174, 1), // defult value
    this.borderColor = Colors.transparent // defult value (the color will be as same as defult button color)
    
    
    });

    final String buttonText;
    final Function()? function;
    Color? buttonColor; // the color could be null and we will assign to it a defult value
    Color borderColor; // the color could be null and we will assign to it a defult value

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
            onTap: function,
             child: Container(
              width: 150,
              height: 50,
              margin: const EdgeInsets.all(5),
             
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(15),

                border: Border.all( // the user can add color to the borders (optional)
                  color: borderColor,
                  width: 3,
                )
              ),
              
             
              child:  Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
             ),
           );
  }
}