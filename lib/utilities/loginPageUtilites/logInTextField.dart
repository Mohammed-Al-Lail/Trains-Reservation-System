import 'package:flutter/material.dart';

// ignore: must_be_immutable
class logInTextField extends StatefulWidget {

   logInTextField({

    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.obscureText ,
    
    });

  final TextEditingController controller ;
  final String hintText;
  final IconData? prefixIcon ; // not necessary to provid the icon it could be = null
  bool obscureText ;

 
  @override
  State<logInTextField> createState() => _logInTextFieldState();
}

class _logInTextFieldState extends State<logInTextField> {

// late private variable {can be used only on this class}
late final bool _isObsecure = widget.obscureText ;  // this variabl will be used to know if the text field was obsecure or not [defined as late since its value will be taken from another variable later]

  // method to see the passowrd 
  void tagglePassowrd(){

    setState(() {
      widget.obscureText = ! widget.obscureText ;
    });
  }


  @override
  Widget build(BuildContext context) {

    

    return  Padding(
            padding: const EdgeInsets.all(15.0),

            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, // let the width of the TextField = 50 % from the screen size,
              child: TextField(
                controller: widget.controller ,
                obscureText: widget.obscureText,
                
                
              
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  
                ),
              
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                // left icon
                  prefixIcon: Icon(widget.prefixIcon, size: 40, color: Colors.grey[700],),
                // right icon (if the text was obsecure will  appear)
                  suffixIcon: _isObsecure ? IconButton(
                    onPressed: tagglePassowrd,
                    icon:  Icon(
                      Icons.remove_red_eye_outlined , 
                      size: 25,
                      color: widget.obscureText? Colors.grey.shade700: Colors.red.shade600,) )
                     : null, // if the text field was not obsecure this icon will not appear 
                    
              
                  hintText: widget.hintText,
                  hintStyle: const TextStyle( fontSize: 18, color: Colors.black38),
                  border: OutlineInputBorder(  borderRadius: BorderRadius.circular(12),),
              
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.brown.shade500,
                      width: 4
                    ),
                    
                  )
              
              
                ),
                
              
              ),
            ),
          );


  }
}