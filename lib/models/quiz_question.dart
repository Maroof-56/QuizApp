// this file is for question bluePrint
// for addting data and logic inside class 



class QuizQuestion{
   const QuizQuestion(this.text,this.answer);
  final String text;
  final List<String> answer;

  // logic for shuffle answers
  List<String> getShuffledAnswer(){
    final shuffledList = List.of(answer);
      shuffledList.shuffle();
      return shuffledList;
  }
}