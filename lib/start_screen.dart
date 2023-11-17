
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 2nd dart file made after main.dart


class StartScreen extends StatelessWidget{
const StartScreen( this.startQuiz,{super.key});

 final void  Function() startQuiz;

  @override
  Widget build(context){
   return  Center(
    child:Column(
      mainAxisSize:MainAxisSize.min, // this will take as much as size of img needed for column
      children: [
      
       Image.asset('assets/images/icon.png',// add child for image
     // width: 50,   // 2nd way to transParent img(here not use bcoz of img)
      height: 100,
      color:Colors.white,
      ),
    //   Opacity(
    //     opacity: 0.5,  // 1st way of using ocity
    // child: Image.asset('assets/images/img-4.png',// add child for image
    //   width: 300,
    //   ),
    //  ),
    
     const SizedBox(height: 40,),
        Text('Learn Flutter Fluently',
      style: GoogleFonts.balooBhaijaan2(
        color:Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )
      ),
     const SizedBox(height: 15,),
       OutlinedButton.icon(    // when i add .icon here it show error for child so i made it label
        onPressed: startQuiz,  // above i made a variable as start quiz
     style: OutlinedButton.styleFrom(  // want to aPPly style on button this method works
       foregroundColor: Colors.white, // this is a text color
       
     ),
     icon:  const Icon(Icons.keyboard_arrow_right_rounded), // can add by after add .icon
     label : const Text('Start Quiz'), // label used here instead of text
     ), 
   ],),);
  }
}