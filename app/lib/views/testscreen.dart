import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/quesitons.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<QuizScreen> {
  var score = 0;
  var n = 0;
  List que_list = [
    Questions(
        "1.Event Management and Knowledge Management are part of Service Operation.",
        false),
    Questions(
        "2.A service is a means of delivering value to customers by facilitation favorable outcomes without the ownership of specific costs and risks",
        true),
    Questions(
        "3.One main purpose of a toll is to automate the workflow.", true),
    Questions(
        "4.Organizational survival is based on the understanding of the values created for the customer as well as themselves.",
        true),
    Questions(
        "5.The objective of Service Design is to design services in such a fashion that minimal improvements are necessary during their life cycle.",
        true),
  ];
  void checkAnswer(bool choice, BuildContext ctx) {
    if (choice == que_list[n].ans) {
      score = score + 1;
      final snackbar = SnackBar(
        content: Text("Correct"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      if (n < que_list.length - 1) {
        n = n + 1;
      } else {
        final snackbar = SnackBar(
          content: Text("Quiz Completed Score: $score/5 "),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blueAccent,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Simple Quiz"),
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (ctx) => Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Score :$score/5 ",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => reset(),
                    child: Text(
                      "Reset ",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.brown),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      que_list[n].que,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    child: Text("True"),
                    onPressed: () => checkAnswer(true, ctx),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 231, 27),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("False"),
                    onPressed: () => checkAnswer(false, ctx),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 245, 0, 0),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
