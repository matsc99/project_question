import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Errou tudo!';
    } else if (pontuacao < 20) {
      return 'Parabéns!';
    } else if (pontuacao < 30) {
      return 'Muito bom!';
    } else if (pontuacao < 40) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        MaterialButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        ),
      ],
    );
  }
}
