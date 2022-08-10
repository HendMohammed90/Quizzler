import 'package:quizzler/question.dart';

class QuizeBrain {
  int _num = 0;
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestionText() {
    return _questionBank[_num].quest;
  }

  bool getQuestionAnswer() {
    return _questionBank[_num].answer;
  }

  // int getLength() {
  //   return _questionBank.length;
  // }

  void nextQuest() {
    if (_num < _questionBank.length - 1) {
      _num++;
    }
    print(_num);
    // print(_questionBank.length);
  }

  // Future<bool> restQuestnumber() {
  //   if (_num == 12) {
  //     // return AlertDialog(
  //     //   title: const Text('The End'),
  //     //   content: const Text('The Question has been ended press ok to reset'),
  //     //   actions: <Widget>[
  //     //     TextButton(
  //     //       // onPressed: () => Navigator.pop(),
  //     //       child: const Text('OK'),
  //     //     ),
  //     //   ],
  //     // );
  //     _num = 0;
  //     return Alert(
  //       context: context,
  //       title: "The End",
  //       desc: "The Question has been ended",
  //     ).show();
  //   }
  // }

  bool isFinished() {
    if (_num >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _num = 0;
  }
}
