import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

void main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Beto'],
    },
  ];

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[perguntaSelecionada]['respostas'] as List<String>
        : [];

    //for (String textoResp in perguntas[perguntaSelecionada]['respostas'] as List<String>) {
    //respostas.add(Resposta(textoResp, responder));
    //}

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Perguntas ficam no topo
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (temPerguntaSelecionada) ...[
            Questao(_perguntas[perguntaSelecionada]['texto'] as String),
            ...respostas.map((t) => Resposta(t, responder)),
          ] else
            Expanded(
              // Para centralizar a mensagem
              child: Center(
                child: Text(
                  'Parabéns! Você respondeu todas as perguntas.\nObrigado por participar!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
