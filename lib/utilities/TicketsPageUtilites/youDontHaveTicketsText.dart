import 'package:flutter/material.dart';


class noTicketsAvalableText extends StatelessWidget {
  const noTicketsAvalableText({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
      
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
          // exclamation mark Image
            SizedBox(
              height: 100, 
              width: 100,
              child: Image.asset(
                "lib/Images/Exclamation_mark.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10,),

          Text(
            "Unfortunatly",
            style: TextStyle(
              color: Colors.pink[400],
              fontSize: 60,
              fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 3,),
      
          Text(
            "No Tickets was Found.",
            style: TextStyle(
              color: Colors.pink[400],
              fontSize: 38,
              fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 3,),
      
        
          Text(
            "Make new Reservation",
            style: TextStyle(
              color: Colors.pink[200],
              fontSize: 32,
              fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 3,),
      
          Text(
            "To git new Tickets now !!",
            style: TextStyle(
              color: Colors.pink[200],
              fontSize: 30,
              fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 3,),
      
          // MyElevatedButton(
          //   title: "Go Back",
          //    onPressed: (){
          //     Navigator.pop(context);
          //    }
          //    ),
        ],
      ),
    );
  }
}