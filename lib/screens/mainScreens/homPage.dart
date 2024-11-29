import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/trainProvider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/trainsOptionsPage.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/HomePageUtilites/MyCircularProgressIndicator.dart';
import 'package:trains_reservation_app_ics321_project/utilities/HomePageUtilites/MydropDownButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/HomePageUtilites/WelcomingMessage.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
   HomePage({super.key, required this.passengar});

  final Passengar passengar;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <String> cityList = ["Dammam", "Riyadh", "Makkah", "Maddinah", "Jeddah"];

  String? originCity;

  String? distenationCity;

  String? departureDate;

  String? numberOfTravelers;
  bool _isLoading =false ;

// method for search button 
void searchButtonMethod(BuildContext ctx){

  Provider.of<trainProvider>(ctx,listen: false).fillterTrains(originCity!, distenationCity!);
 
  Future.delayed(
    const Duration(seconds: 3),
    (){
      
      Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=> const TrainsOptionsPage() ) );

    }
  );
  
}

// Method to simulate a network call
  Future<void> _loadData() async {  // we used Future , in case we want to get data from the internet
    setState(() {
      _isLoading = true; // Set loading state to true, to show the indicator
    });

    // Simulate a network call
    await Future.delayed(const Duration(seconds: 7));

    // After loading is done
    setState(() {
      _isLoading = false; // Set loading state to false after 7 seconds to close the indicator
    });
  }


  int _bottomNavigationBarIndex=0;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: Colors.blueGrey[800],

      bottomNavigationBar: BottomNavigationBar( // BottomNavigationBar
      backgroundColor: Colors.blueGrey.shade300.withOpacity(0.7),
      
      currentIndex: _bottomNavigationBarIndex,

        items:  [
          // log out icon
          BottomNavigationBarItem(

            icon: IconButton(

              onPressed: (){

                setState(() {
                  _bottomNavigationBarIndex=0;
                });
                Provider.of<usersProvider>(context,listen: false).resetPassengerObject(); // to reset the passenger object again to be =null
                Navigator.pop(context);
              }, 
              icon:  Icon(
                Icons.logout_rounded,
                color: _bottomNavigationBarIndex ==0 ? Colors.deepPurple : Colors.black,
                )
              ),
            label: "Log-out",
            
            ),

          // train ticket icon
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
                setState(() {
                  _bottomNavigationBarIndex=1;
                });
                
              }, 
              icon:  Icon(
                Icons.train_outlined,
                color: _bottomNavigationBarIndex ==1 ? Colors.deepPurple : Colors.black,
                )
              ),
            label: "Tickets",

            ),

          
        ],
      ),

      body:  SafeArea(
        child: _isLoading? const MyCircularProgressIndicator()
        : 
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
        
          child: Column(
          
            children: [
          
              const SizedBox(height: 30,),
        
              welcomingMessage(passengar: widget.passengar),
              const SizedBox(height: 10,),
        
              // container for searching proccess
              Container(
                height: 300, 
                width: MediaQuery.of(context).size.width* 0.9, // take 90% from the screen size
                
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: Colors.blueGrey[100]
                
                ),
        
                child: Column(
        
                  children: [
        
                    const SizedBox(height: 10,),
        
                    // to select origin and distenation cities
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      // for origin city
                          MyDropDownButton(
                           label: "From",
                           hintText: "Origin",
                           itemList: cityList,
                           value: originCity,
                           onChanged: (val) {
                             setState(() {
                               originCity=val as String;
                             });
                           },
                          ),
                      // for distination city
                          MyDropDownButton(
                           label: "To",
                           hintText: "Distenation",
                          itemList: cityList,
                          value: distenationCity,
                          onChanged: (val) {
                            setState(() {
                              distenationCity=val as String;
                            });
                          },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Divider( color: Colors.grey[700], thickness: 2,),
                      
                      
                   
                    // To select departure date 
                    MyDropDownButton(
                           label: "Departure Date",
                           hintText: "Date",
                          itemList: cityList,
                          value: departureDate ,
                          onChanged: (val) {
                            setState(() {
                              departureDate=val as String;
                            });
                          },
                          
                          ),
        
                    const SizedBox(height: 20,),
                    Divider( color: Colors.grey[700], thickness: 2,),
        
                    // search Button
                const Expanded(child: SizedBox()),
                MyElevatedButton(
                  title: "Search",
                   onPressed: (){
                    _loadData(); // call this method first
                    searchButtonMethod(context);
                   }
                   ),
                   const SizedBox(height: 5,),
        
                  ],
                ),
              ), // End of the container that have all the buttons
        
              const SizedBox(height: 10,),
              
          
              
            ],
          ),
        ),
      ),



    );
  }
}