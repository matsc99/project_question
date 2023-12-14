import 'package:flutter/material.dart';
import 'package:project_question/questao.dart';
import 'package:project_question/resposta.dart';
import 'package:project_question/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Azul', 'Branco'],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    //for (var textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //widgets.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: <Widget>[
                    Questao(
                        _perguntas[_perguntaSelecionada]['texto'].toString()),
                    ...respostas.map((t) => Resposta(t, _responder)).toList(),
                  ],
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
