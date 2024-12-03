

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDropDownButton extends StatefulWidget {

   MyDropDownButton({ // constructor
    super.key,
    required this.value,
    required this.label,
    required this.hintText,
    required this.itemList,
    required this.onChanged,
  });

  // class fielsd
    dynamic value;
    final String label;
    final String hintText;
    List<dynamic> itemList;
    void Function(Object?)? onChanged;

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Text(
        widget.label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),

      ),
      const SizedBox(height: 5,),

      // for drop down menue
       Container(
         height: 40,
         width: MediaQuery.of(context).size.width*0.2, // 30% from the screen size
         decoration: BoxDecoration(
          color: Colors.blueGrey[400],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 3
          )
         ),

         child: DropdownButtonHideUnderline( // this widget will remove the underline for the DropdownButton
           child: DropdownButton(

             value: widget.value,
             items: widget.itemList.map((e) => DropdownMenuItem(
              value: e,
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  "$e",
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  ),
              )
              )
              ).toList(),
           
             onChanged: widget.onChanged,
             hint:  Padding(
               padding: const EdgeInsets.only(left: 3),
               child: Text(
                widget.hintText,
                style: const TextStyle(
                  color: Colors.amber
                ),
                ),
             ),

          // Styling the dropDownButton
             dropdownColor: Colors.blueGrey,
             iconEnabledColor: Colors.white,

             
            
             ),
         ),
       ),

      ],

    );

  }
}