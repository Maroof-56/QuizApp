
import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({super.key,required this.onSelectanswer});
  final void Function(String answer) onSelectanswer;
  @override
  State<Question> createState(){
    return _QuestionState1();
}
}

class _QuestionState1 extends State<Question> {
  var currentQuestionIndex = 0;

  // for changing question after click on button answer
  void answerQuestion(String selectedAnswer){
    widget.onSelectanswer(selectedAnswer); // give acces to func outside of state class
    // currentQuestionIndex += 1; 
    setState(() {
    // currentQuestionIndex ++;
    currentQuestionIndex = currentQuestionIndex + 1; 
    });   
  }
   @override
  Widget build(context){
  final currentQuestion = questions[currentQuestionIndex ];  // funct aPPly here
    return   SizedBox(
      width: double.infinity, // this is same function as center (& it take as much widht as can)
      child:  Container(
         margin: const EdgeInsets.all(100),  // not worling
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // takes in center
          crossAxisAlignment: CrossAxisAlignment.stretch, //take all left rigth value

         children: [
        Text(
            // 'Questions Are...',
            currentQuestion.text, // add this here .text for string
          style: GoogleFonts.laila(
            color:const Color.fromARGB(255, 26, 2, 60),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            
          ),
             textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
          //  ...currentQuestion.answer.map((answer){   // Pevious one               // ... is an built in function 
           ...currentQuestion.getShuffledAnswer().map((answer){                  // ... is an built in function 
            return AnswerButton(answerText: answer,onTap:(){
              answerQuestion(answer);
            });
           }),                     // on this function my buttons style not working
          const SizedBox(height: 40),
           //above function do work below manual write button
          //  AnswerButton(
          //   answerText: currentQuestion.answer[0],
          //   onTap: (){}),
          //  const SizedBox(height: 20),
          //  AnswerButton(
          //   answerText: currentQuestion.answer[1],
          //   onTap: (){}),
          //  const SizedBox(height: 20),
          //  AnswerButton(
          //   answerText: currentQuestion.answer[2],
          //   onTap: (){}),
          //  const SizedBox(height: 20),
          
          //  AnswerButton(
          //   answerText: currentQuestion.answer[3],
          //   onTap: (){}),
        ],),
      ),
    );
  }
}