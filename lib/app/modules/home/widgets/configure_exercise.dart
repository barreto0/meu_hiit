import 'package:flutter/material.dart';
import 'package:meu_hiit/app/modules/helpers/text_style_helper.dart';

class ConfigureExercise extends StatelessWidget {
  const ConfigureExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Configurar exercício',
        style: TextStyleHelper.configureExercise(context),
      ),
    );
  }
}
