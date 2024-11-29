import 'package:flutter/material.dart';

class myTextButton extends StatelessWidget {
  const myTextButton({
    
    super.key,
    required this.message,
    required this.textButtonMessage,
    required this.function,
    
    });

  final String message ;
  final String textButtonMessage;
  final Function()? function ;

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
                 Text(
                  message,
                  style:TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[350],
                  ),
                ),
                const SizedBox(width: 2,),
               
        
                TextButton(
                  onPressed: function,
                   child: Text(
                    textButtonMessage,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[200],
                    ),
                    ),
                    
                  ),
              ],
             );
  }
}