import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = const [
    {
      'texto': 'COMO PODEMOS APRENDER FLUTTER DA MELHOR FORMA?',
      'respostas': [
        'UTILIZANDO O CHATGPT',
        'USANDO O GEMINI',
        'PESQUISANDO E PRATICANDO BASTANTE',
        'UTILIZANDO A DEEPSEEKB'
      ],
    },
    {
      'texto': 'QUAL A COMPOSIÇÃO QUÍMICA DA AGUA?',
      'respostas': ['CO2', 'H2SO4', 'NaHCO3', 'CaCO3'],
    },
    {
      'texto': 'QUAL É A RAIZ QUADRADA DE 16?',
      'respostas': ['25', '4', '3', '2X17+25'],
    },
    {
      'texto': 'QUAL CONTINENTE FICA A AUSTRALIA?',
      'respostas': ['HEMISFERIO SUL', 'OCEANIA', 'AMERICA DO NORTE', 'EUROPA']
    },
    {
      'texto': 'QUAL A CAPITAL DO JAPÃO?',
      'respostas': ['TOKIO', 'BRASILIA', 'PARIS', 'OTTAWA']
    },
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                
                'images/logo.png',
                
                height: 100, // Ajuste conforme necessário
              ),
              const Text(
                'SHOW DO MILHÃO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(221, 30, 0, 70), // Cor vibrante
          foregroundColor: Colors.white,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: responder)
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
