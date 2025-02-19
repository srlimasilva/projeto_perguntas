import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {

  void responder(){
    print("Pergunta respondida");
  }


  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual é a sua cor favorita?",
      "Qual é o seu animal favorito?",
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Perguntas"),
      ),
      body: Column(
        children: [
          Text(perguntas[0]),
          TextButton(
              child: const Text("Resposta 1"),
              onPressed: () {
                responder();
              }),
          TextButton(
            child: const Text("Resposta 2"),
            onPressed: () {
              null;
            },
          ),
          TextButton(
            child: const Text("Resposta 3"),
            onPressed: () {
              null;
            },
          ),
        ],
      ),
    ));
  }
}
