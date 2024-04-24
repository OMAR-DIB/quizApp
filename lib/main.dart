import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'appBrain.dart';

AppBrain app = AppBrain();
void main() => runApp(const ExamApp());

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'my exam',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  void checkAnswer(bool choice) {
    bool Result = app.getQuestAnswer();
    setState(() {
      if (Result == choice) {
        answerResult.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answerResult.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (app.ending() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "quiz game is end",
          desc: "Restart quiz",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        app.reset();
        answerResult = [];
      } else {
        app.setQuestNb();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Image.asset(app.getQuestImage()),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  app.getQuestText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 60),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(240, 24, 2, 189))),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text('true'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 60),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              child: const Text('False'),
            ),
          ),
        ),
      ],
    );
  }
}
