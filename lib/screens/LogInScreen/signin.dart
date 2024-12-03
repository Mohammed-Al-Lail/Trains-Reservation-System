import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_reservation_app_ics321_project/Services/usersProvider.dart';
import 'package:trains_reservation_app_ics321_project/classes/passengar.dart';
import 'package:trains_reservation_app_ics321_project/screens/LogInScreen/signup.dart';
import 'package:trains_reservation_app_ics321_project/screens/mainScreens/homPage.dart';
import 'package:trains_reservation_app_ics321_project/utilities/loginPageUtilites/TitleText.dart';
import 'package:trains_reservation_app_ics321_project/utilities/loginPageUtilites/logInTextField.dart';
import 'package:trains_reservation_app_ics321_project/utilities/loginPageUtilites/loginButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/loginPageUtilites/myTextButton.dart';
import 'package:trains_reservation_app_ics321_project/utilities/loginPageUtilites/personContainer.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  TextEditingController userNameController = TextEditingController() ;

  TextEditingController passowrdController = TextEditingController() ;


  // method for loginButton 
  void logInButtonMethod(){
    if(Provider.of<usersProvider>(context,listen: false).signInMethod(userNameController.text, passowrdController.text)){ // if the passowrd and email correct
      
      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          backgroundColor: Colors.green[700]?.withOpacity(0.6),
          duration: const Duration(seconds: 2), // remaining for 2 seconds, then desaper

          content: const SizedBox( // we will use size box to controll the size of the snackBar
            height: 30,

            child: Center(

              child: Text(
                "Sign In Successfully",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          )
      );

      
      Passengar p =Provider.of<usersProvider>(context,listen: false).allPassengarsMap[userNameController.text]!; // do not forget to add (!) since we sure this passengar exist 

      userNameController.clear(); //reset the value again
      passowrdController.clear(); //reset the value again
      
      Future.delayed( // after 3 seconds go to the home page ( if the info was correct)
         const Duration(seconds: 3),
        ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(passengar: p,)))
      );
      
    }



    else{ // show error meassage 

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3), // remaining for 2 seconds, then desaper

          content: SizedBox( // we will use size box to controll the size of the snackBar
            height: 30,

            child: Center(

              child: Text(
                "Wrong Information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          )
      );


    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blueGrey[800],
      

      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text(
          "Sign In Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
        automaticallyImplyLeading: false, 
        
        
      ),


      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        
        
          children: [
        
            const SizedBox(height: 50,),
        
            // for login text
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.24),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[100]
                    ),
                  ),
                ),
              ],
            ),

            const personContainer(),
            
            // username Text 
            const TitleText("Username"),
              
            // user name text field
            logInTextField(
              controller: userNameController,
              hintText: "User Name",
              prefixIcon: Icons.person_2_outlined,
              obscureText: false
             ),

             // Passowrd Text 
             const TitleText("Passowrd"),
        
             // passowrd text field
             logInTextField(
              controller: passowrdController,
              hintText: "Passowrd",
              prefixIcon: Icons.lock_outline,
              obscureText: true,
             ),
        
             const SizedBox(height: 10,),
        
             // log in Button
             logInButton(
              buttonText:"LOGIN",
              function: logInButtonMethod
              ),
              
             const SizedBox(height: 10,),
             
        
             // for don't have account? sign up now Text
             myTextButton(
              message: "don't have acoount ?",
              textButtonMessage: "sign up",
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const signUpPage()));
              },
             ), 
        
        
        
        
            
          ],
        
        
        
        
        
        
        ),
      ),
    );
  }
}