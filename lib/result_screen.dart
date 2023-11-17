import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  // show how much answer is correct out of question (used maP here thats why )
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text, // exact question in dart(store question text)
        'correct_answer': questions[i].answer[0], // correct ans at 1st  thats y at [0]
        'user_answer': chosenAnswer[i],
      });
    }
    return summary; // arrow function in dart ,can write => by removing return keyword & ()
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();  // getter method in dart -> use get before variable name without Parenthesis it can used -> get summaryData like that 
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {//where filter the
      return data['user_answer'] == data['correct_answer']; // means user choose right answer
    }).length; // filter list ko return krega

    return SizedBox(
      width: double.infinity, // this is same function as center (& it take as much widht as can)
      child: Container(
        margin: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestion out of $numTotalQuestion question Correctlty!',
            ),
          
            const SizedBox(
              height: 20,
              
            ),
            //  const Text('List of Answer and Question '),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 20,
            ),

            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
              
            )
          ],
        ),
      ),
    );
  }
}
