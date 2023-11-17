

import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData,{super.key});

  final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context){
    return SizedBox(            // wraPPed with sizedbox(add this bcoz of summary in alignment)
    height: 300,
      child: SingleChildScrollView(    // wrPPed another with widget namesinglescroll for scrolling
        child: Column(
          children: summaryData.map(
            (data) {
               return Row(children: [
                 Text(((data['question_index'] as int) +1 ).toString()),  // tyPe casting here,as dart not now which kind of value is this but we know 
                   Expanded(              // clicking on column wraPPed with widget cut widget & wrte exnPanded so 72 Pixel error gone from result screen Page
          
                     child: Column(children: [  // for disPlay your answer & right answer
                      Text(data['question'] as String),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String)
                     ],),
                   )
               ]);
        },
        ).toList(),  // tolist bcoz of maP
        ),
      ),
    ) ;  
  }
}