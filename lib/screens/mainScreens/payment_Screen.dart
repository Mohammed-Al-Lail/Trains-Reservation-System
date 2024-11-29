import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/trainProvider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/homPage.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';


class PayScreen extends StatefulWidget {
   PayScreen({super.key, required this.train,});

 final Train train; // we must bass a train object to this class
  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {

final _formKey = GlobalKey(); // we will use it within the form widget
 
final TextEditingController _cardNumController = TextEditingController();

final TextEditingController _cardCvvController = TextEditingController();

final List yearsList = [25,26,27,28,29,30,31,32];

final List monthsList = [01,02,03,04,05,06,07,08,09,10,11,12];

 String ExpiryMonth= "" ;

 String Expiryyear= "" ;


 // method to check card information validity

    bool isValid(){

      if( // The valid conditions
        _cardNumController.text.isEmpty || _cardCvvController.text.isEmpty ||
         ExpiryMonth =="" || Expiryyear=="" ||_cardNumController.text.length<12||
          _cardCvvController.text.length<3
         ){
        return false;
      }
      return true;
    }
 // method for save Button 

 void saveButtonMethod(){


    
    if(isValid()){
                                
         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  const SizedBox(
              height: 30,

              child: Center(
                      
                child: Text(
                    "You paied Successfully",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                    backgroundColor: Colors.black.withOpacity(0.7),
                    duration: const Duration(seconds: 2),
                    
             ),
             
      );
      Provider.of<trainProvider>(context,listen: false).payButtonMethod(widget.train);
      //Provider.of<usersProvider>(context,listen: false).resetPassengerObject();

      Future.delayed( // close the page after 4 seconds
        const Duration(seconds: 4),

        ()=> Navigator.pushAndRemoveUntil( // this is to delete all the stack Navigator items (for better performence)
          context, 
           MaterialPageRoute(builder: (context)=> HomePage(passengar: Provider.of<usersProvider>(context).getPassengar!)), // this page will be the only page on the stack after implementing this function {it could be the second page if we use the predicate}
          (route) {
            return route.isFirst; // by using the predict , every thing on the stack will be removed exept this widget{the first root on the stack} => (signIn page)
            // if we return false , everything on the stack will be deleted
          },
          ),
        
      );


    }

    else {

       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  const SizedBox(
              height: 30,

              child: Center(
                      
                child: Text(
                    "incompleted Information",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                    backgroundColor: Colors.red.withOpacity(0.7),

                    duration: const Duration(seconds: 2),
                    
             )
      );
    }
  
 }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade200,
      
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title:Text(
                "Card information",
                style: GoogleFonts.aclonica(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

       centerTitle: true,       


      ),

      body: SafeArea(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
          
            children: [
              
                const SizedBox(height: 10,),
          
              // credit card
                CreditCardWidget( // using flutter_credit_card Package
          
                // required arguments
                  cardNumber: _cardNumController.text.toString(), 
                  expiryDate: " $ExpiryMonth/$Expiryyear", 
                  cardHolderName: "Mohammed Al Lail", 
                  cvvCode: _cardCvvController.text.toString(), 
                  showBackView: false, 
                  onCreditCardWidgetChange: (CreditCardBrand brand){},
          
                // optional Arguments
                  cardBgColor: Colors.black,
                  bankName: "AL-Lail Bank",
                  isHolderNameVisible: true, // holder name
                  labelValidThru: "Expiry Date:",
                  obscureInitialCardNumber: true, // is the first numbers secure?
                  obscureCardCvv: false, // Cvv
                  cardType: CardType.mastercard, // card type
                  isSwipeGestureEnabled: true, // enable flipping the card
                  chipColor: Colors.yellow.shade300, // chip color
          
                  ),
          
                  
          
                  Divider(color: Colors.grey.shade700, thickness: 2,),
                  const SizedBox(height: 20,),

                 //Form widget => to get the card info
                  Form(
                  key: _formKey,

                  child:  Column(
          
                    children: [

                      // card Number (Text)
                        const Center(
                           child: Text(
                            "Card Number",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                         ),
                         const SizedBox(height: 5,),
          
                      // text form field (card number)
                         Padding(
                           padding: const EdgeInsets.only(left:8 , right: 8),
          
                           child: TextFormField(
                            controller: _cardNumController,
                            onChanged: (value) {
                              setState(() {  }); // updating the state after each change
                            },
                               keyboardType: TextInputType.number,
                               textAlign: TextAlign.center,
                               maxLength: 12,
                               
                               decoration: InputDecoration(
                               
                                enabledBorder: OutlineInputBorder(
          
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:  BorderSide(
                                    color: _cardNumController.text.length ==12 ? Colors.grey.shade600 :Colors.red.shade800,
                                    width: 2
                                  )
                                ),
          
                                focusedBorder: OutlineInputBorder(
          
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:  BorderSide(
                                    color: _cardNumController.text.length ==12 ? Colors.grey.shade600 :Colors.red.shade800,
                                    width: 4
                                  )
                                ), 
                                
          
                                label: const Text("Card Number",),
          
                                labelStyle: TextStyle( fontSize: 18, color: Colors.grey.shade600)
                           
                                ),
                                
                           ),
                         ),
          
                         const SizedBox(height: 10,),
                        
                        // Expiry date (Text)
                         const Center(
                           child: Text(
                            "Expiry Date",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                         ),
                         
                        const SizedBox(height: 5,),
          
                         
                      //Drop Down button form field  (card Expiry date) , two dropDonButton
          
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [

                           // for Month
                            SizedBox(
                              height: 80,
                              width: 100,
                              child: DropdownButtonFormField(
                                items: monthsList.map((e) => DropdownMenuItem(value: e,child: Text("$e") ,)).toList(), 
                                onChanged: (val){
                                  setState(() {
                                    ExpiryMonth = val.toString();
                                  });
                                },
                                hint: const Text("Month",),
                                decoration: InputDecoration(
                                  enabled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ExpiryMonth=="" ? Colors.red.shade800 : Colors.grey,
                                      width: 3
                                    )
                                  )
                                ),
                                ),
          
                            ),
          
                        //for year
                          SizedBox(
                              height: 80,
                              width: 100,
                              child: DropdownButtonFormField(
                                items: yearsList.map((e) => DropdownMenuItem(child: Text("$e") , value: e,)).toList(), 
                                onChanged: (val){
                                  setState(() {
                                    Expiryyear = val.toString();
                                  });
                                },
                                hint: const Text("year",),
                                decoration: InputDecoration(
                                  enabled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Expiryyear=="" ? Colors.red.shade800 : Colors.grey,
                                      width: 3
                                    )
                                  )
                                ),
                                ),
          
                            ),
                            
                          ],
                        ),

                      // Cvv (Text)
                        const Center(
                           child: Text(
                            "Cvv",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                         ),
                         const SizedBox(height: 5,),

          
                      //text form field (cvv)
                        SizedBox(
                         width: 180,

                          child: TextFormField(
                            controller: _cardCvvController,
                            onChanged: (value) {
                              setState(() {}); // updating the state after each change
                            },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 3,
                              
                              decoration: InputDecoration(
                              
                               enabledBorder: OutlineInputBorder(
                                    
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide:  BorderSide(
                                   color: _cardCvvController.text.length ==3 ? Colors.grey.shade600 :Colors.red.shade800,
                                   width: 2
                                 )
                               ),
                                    
                               focusedBorder: OutlineInputBorder(
                                    
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide:  BorderSide(
                                   color: _cardCvvController.text.length ==3 ? Colors.grey.shade600 :Colors.red.shade800,
                                   width: 4
                                 )
                               ), 
                               
                                    
                               label: const Text("Cvv",),
                                    
                               labelStyle: TextStyle( fontSize: 18, color: Colors.grey.shade600)
                          
                               ),
                              
                          ),
                        ),
                    ],
          
          
                  ),
                  
                  ), //End of the form


                  
                 
                 Divider(color: Colors.grey.shade700, thickness: 2,),
                  const SizedBox(height: 20,),
              
               // Save button
                 MyElevatedButton(
                  title: "Pay",
                   onPressed: saveButtonMethod
                   ),
                  
          
            ],
          ),
        ),
      ),
    );
  }
}