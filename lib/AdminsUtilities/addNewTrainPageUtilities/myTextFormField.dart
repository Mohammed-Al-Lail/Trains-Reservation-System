import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.label,

    //optional argumants
    this.maxLength,
    this.validator

    
    });

  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;
  final int? maxLength;




  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15),

      child: TextFormField(
        
        controller: controller,
        maxLength: maxLength,
        keyboardType: TextInputType.number,
        
      // style of the text will be written inside the text field
        style: const TextStyle( 
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      
      
        decoration: InputDecoration(
          fillColor: Colors.blueGrey[400],
          filled: true,
          label: Text(label),
      
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1
            ),
          ),
      
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 3
            )
          ),
      
          labelStyle:  const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w900
          ),
      
        ),

        validator: validator,
      
      ),
    );
  }
}