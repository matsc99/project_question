import 'package:flutter/material.dart';
import 'package:project_question/questao.dart';
import 'package:project_question/resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print('Pegunta respondida!');
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é sua cor favorita?',
        'respostas': ['Preto', 'Vermeljo', 'Azul', 'Branco'],
      },
      {
        'texto': 'Qual o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
    ];

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];

    //for (var textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //widgets.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
