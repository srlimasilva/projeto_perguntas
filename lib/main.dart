import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {

  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {

  var perguntaSelecionada = 0;


  void responder(){
    setState(() {
      perguntaSelecionada++;
    });
    print("Pergunta respondida");
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual é a sua cor favorita?",
      "Qual é o seu animal favorito?",
      "Qual é o animal que faz MU?"
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Perguntas"),
      ),
      body: Column(
        children: [
          Text(perguntas[perguntaSelecionada]),
          TextButton(
              child: const Text("Resposta 1"),
              onPressed: () {
                responder();
              }),
          TextButton(
            child: const Text("Resposta 2"),
            onPressed: () {
              responder();
            },
          ),
          TextButton(
            child: const Text("Resposta 3"),
            onPressed: () {
              responder();
            },
          ),
        ],
      ),
    ));
  }
}
