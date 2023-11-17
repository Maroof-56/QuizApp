import 'package:flutter/material.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result_screen.dart';


 // 3rd dart file made after main.dart

class Quiz extends StatefulWidget {
 const  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}



class _QuizState extends State<Quiz> { // _ -> means this class is Private & cant use outside of this file
 // for dislaying selected asnwer 
  List<String> selectedAnswer = [];
  // var activeScreen  = const StartScreen(); // not work inside function
  //Widget? activeScreen;  // isliyw widget use kia a-1
   
   var activeScreen = 'start-screen';     // a-2
  //  @override
  // void initState() {
  //   activeScreen  =  StartScreen(switchScreen);  //a-1
  //   super.initState();
  // }
  void switchScreen(){
    setState(() { // build method run again helof setstate ,& outPut is Questin screen
      // activeScreen = const Question(); a-1
      activeScreen = 'question-screen';  // a-2
    });
  }

  // for not getting error after selected answer
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);    
    if(selectedAnswer.length == questions.length){
      setState(() {
       // selectedAnswer=[]; // after add this it will return to startscreen Page after last question(not getting eroor of range)
        activeScreen='result-screen';
      });
    }
  }
  

  @override
  Widget build(context){
    // final screenWidget = activeScreen == 'start-screen'
    //  ? StartScreen(switchScreen)
    //: const Question();  //  this var-final used here  work inside build(andother aPProach this is )
   
    // Another Method Above
      Widget screenWidget = StartScreen(switchScreen);
      if(activeScreen == 'question-screen'){
        screenWidget =  Question(onSelectanswer: chooseAnswer);
      }

      if(activeScreen == 'result-screen'){
        screenWidget =  ResultsScreen(chosenAnswer: selectedAnswer,);        // for result screen
      }
    
    return  MaterialApp(
      home: Scaffold(
        body:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
             colors: [
              
              Color.fromRGBO(141, 45, 238, 1),
              Color.fromRGBO(141, 45, 238, 1),
              
             
            ],
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            )
            
          ),
          // child: const StartScreen(),  //a-1
          //child: activeScreen, //a-1use this as this is also a widget
          child: screenWidget,
          // activeScreen == 'start-screen' 
          // ? StartScreen(switchScreen):        // a-2 | Previous use inside child
          //  const Question(), //  ternary exession(if else condition)
          
          ), 
      ),
    );
  }
}







// An illustration 

// Startscreen  -----------------------------> QuestonScreen
// (welcome User +  | (switch to qstn scrn |   (walks user thrtough
// Provide 'Start   | once the 'start quiz'|   qstn + lets user Pick 
// Quiz' Button)    | button was toPPed)   |    anser)

// changes state that                          (dePend on 'which
// control which scrn                          scrn is visible?'state)
// is visible                                          |
    //  |______________________________________________|
  //                          |
            //  (Problem Two widget need to use The
           //            - same state)