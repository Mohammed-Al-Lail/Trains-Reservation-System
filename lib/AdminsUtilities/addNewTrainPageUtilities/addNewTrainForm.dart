import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/AdminsUtilities/addNewTrainPageUtilities/myTextFormField.dart';
import 'package:trains_reservation_app_ics321_project/Services/trainProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/Train.dart';
import 'package:trains_reservation_app_ics321_project/utilities/CommonUtilities/MyElevatedButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/HomePageUtilites/MydropDownButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/HomePageUtilites/dateContainer.dart';

class addNewTrainForm extends StatefulWidget {
   addNewTrainForm({super.key});

  @override
  State<addNewTrainForm> createState() => _addNewTrainFormState();
}

class _addNewTrainFormState extends State<addNewTrainForm> {

  List <String> cityList = ["Dammam", "Riyadh", "Makkah", "Maddinah", "Jeddah"];
  TextEditingController? idController=TextEditingController();
  TextEditingController? englishNameController=TextEditingController();
  TextEditingController? arabicNameController=TextEditingController();
  String? originCity;
  String? distenationCity;
  DateTime? _selectedDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // method for add button 
    addButtonMethod(){

    if(originCity != null && distenationCity!= null && _selectedDate!=null){

      Train train=Train(
        trainID: int.parse(idController!.text), 
        englishTainName: englishNameController!.text, 
        arabicTainName: arabicNameController!.text, 
        originCity: originCity!, 
        destinationCity: distenationCity!, 
        departureDate: _selectedDate!

        );


        final trainProvaider=Provider.of<trainProvider>(context,listen: false);

        if(trainProvaider.addNewTrain(train)){ // if the train was added to the list

          ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.black.withOpacity(0.7),
              content: const Center(
                child: Text(
                  "Added Successfully",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              )

          );
        }

        else{ // if the train id already exist on the system

            ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red.shade900.withOpacity(0.7),
              content: const Center(
                child: Text(
                  "Train Id alredy exist on the system !!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              )

          );
        }


    } 

    else{ // not completed information {origin city or distination city or date}

      ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red.shade900.withOpacity(0.7),
              content: const Center(
                child: Text(
                  "Incompleted information !!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              )

          );

    }

        
    }

  // method to pick the date
  Future<void> selectDateMethod() async{

        final DateTime? methodDate = await showDatePicker(

          context: context, 
          firstDate: DateTime.now(), 
          lastDate: DateTime(2025,1,30),

          // for design the date box (search for it later to understand this part)
           builder: (BuildContext context, Widget? child) {

              return Theme(
                  data: ThemeData.dark().copyWith(
                  primaryColor: Colors.blue, // Header color
                  colorScheme: const ColorScheme.dark(primary: Colors.red), // Color scheme for selected date
                  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary), // Button colors
                ),

            child: child!,
             );
           }, // end of builder


          );

          if(methodDate != null && methodDate != _selectedDate){

            setState(() {
              _selectedDate=methodDate;
            });
          }


  }

  @override
  Widget build(BuildContext context) {

    return    Form(
      key: _formKey,

      child: Padding(
        padding: EdgeInsets.all(8.0),

        child: Column(

        
          children: [
        
          // train id text field
             MyTextFormField(
              controller: idController,
              label:"Train ID",
              maxLength: 3,
              validator: (val) {
                if(val!.length !=3){return "Train ID must be of Length 3" ;}
                 return null;
              },
              ),
        
        
            // Row {2 text fields for names}
               MyTextFormField(
                controller: englishNameController,
                label: "Train Name {English}",
                maxLength: 10,
                validator: (val) {
                if(val!.length<=2){return "Train Name must be of Length 3 at leat or more" ;}
                 return null;
              },
                ),

               MyTextFormField(
                controller: arabicNameController,
                label: "Train Name {Arabic}",
                maxLength: 10,
                validator: (val) {
                if(val!.length<=2){return "Train Name must be of Length 3 at leat or more" ;}
                 return null;
                }
                ),


            
            
        
            // Row {for 2 dropdown buttons to select citiec}

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  MyDropDownButton(
                    label: "Origin City",
                    value: originCity, 
                    hintText: "hintText", 
                    itemList: cityList, 
                    onChanged: (val){
                      setState(() {
                        originCity=val as String;
                      });
                    }
                    ),

                    MyDropDownButton(
                    label: "Distenation City",
                    value: distenationCity, 
                    hintText: "hintText", 
                    itemList: cityList, 
                    onChanged: (val){
                      setState(() {
                        distenationCity = val as String;
                      });
                    }
                    ),
                ],
              ),
              const SizedBox(height: 10,),

              //Departure date text
              const Text(
               "Departure date",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 2,),
        
            // icon button to select departure date
              Container(
                   width: 50, 
                   height: 50,
                   decoration:  BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.blueGrey,
                     border: Border.all(
                       color: Colors.black,
                       width: 3
                     )
                   ),
                   child: IconButton(
                     onPressed: selectDateMethod, 
                     icon:  Icon(
                       Icons.date_range_outlined,
                       color: _selectedDate== null? Colors.amber:Colors.white ,
                       size: 28,
                     )
                     ),
                  ),

              // Here we will have the selected date text if it was not null
                SizedBox(
                  width: 300,
                  child: _selectedDate != null?  // if the user select date we will display it on the screen
                  dateContainer(
                    date: _selectedDate!.toLocal().toString().split(" ")[0] // To obtain only the yare,month and day
                    )
                  : null // if the user did not select date
              ),
              const SizedBox(height: 40,),
        
            // add button
            MyElevatedButton(
              title: "Add", 
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  addButtonMethod();
                }
              }
              ),
          ],
        ),
      )
      );
  }
}