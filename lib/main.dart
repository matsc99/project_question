import 'package:flutter/material.dart';
import 'package:project_question/resultado.dart';
import 'package:project_question/questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Um homem calvo é popularmente chamado de...',
      'respostas': [
        {'texto': 'Canhoto', 'pontuacao': 0},
        {'texto': 'Careca', 'pontuacao': 10},
        {'texto': 'Canhoteiro', 'pontuacao': 0},
        {'texto': 'Corote', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Em que país foi realizada a Cop 27, evento que reuniu cerca de 90 chefes de Estado para discutir as mudanças climáticas, em 2022?',
      'respostas': [
        {'texto': 'Egito', 'pontuacao': 10},
        {'texto': 'Equador', 'pontuacao': 0},
        {'texto': 'Eslováquia', 'pontuacao': 0},
        {'texto': 'Espanha', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'A caxumba é uma doença causada por...',
      'respostas': [
        {'texto': 'Bactéria', 'pontuacao': 0},
        {'texto': 'Fungo', 'pontuacao': 0},
        {'texto': 'Protozoário', 'pontuacao': 0},
        {'texto': 'Vírus', 'pontuacao': 10},
      ],
    },
    {
      'texto':
          'Qual foi a primeira cidade do Brasil a receber Dom João VI na transferência da sede do governo português, em 1808?',
      'respostas': [
        {'texto': 'Recife', 'pontuacao': 0},
        {'texto': 'Rio de Jnaeiro', 'pontuacao': 0},
        {'texto': 'Salvador', 'pontuacao': 10},
        {'texto': 'Porto Seguro', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
