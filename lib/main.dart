import 'package:flutter/material.dart';
import 'package:quizzler/quizeBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizeBrain quizeBrain = QuizeBrain();
  void checkAnswer() {
    bool correctAnswer = quizeBrain.getQuestionAnswer();
    setState(() {
      if (quizeBrain.isFinished() == true) {
        // AlertDialog(
        //   title: const Text('The End'),
        //   content: const Text('The Question has been ended press ok to reset'),
        //   actions: <Widget>[
        //     TextButton(
        //       onPressed: () => Navigator.pop(context, 'OK'),
        //       child: const Text('OK'),
        //     ),
        //   ],
        // );
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizeBrain.reset();
        scoreKeeper = [];
      } else {
        if (correctAnswer == true) {
          scoreKeeper.add(Icon(
            Icons.done,
            color: Colors.green,
            size: 24.0,
            semanticLabel: 'Right Answer ',
          ));
          print('User Got it Right');
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Wrong Answer ',
          ));

          print('User Got it Wrong');
        }
        quizeBrain.nextQuest();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizeBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer();
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
