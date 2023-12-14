import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  Resultado(this.pontuacao);

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
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
