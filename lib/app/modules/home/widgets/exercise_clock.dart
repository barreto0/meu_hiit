import 'package:flutter/material.dart';
import 'package:meu_hiit/app/modules/helpers/text_style_helper.dart';

class ExerciseClock extends StatefulWidget {
  const ExerciseClock({Key? key}) : super(key: key);

  @override
  State<ExerciseClock> createState() => _ExerciseClockState();
}

class _ExerciseClockState extends State<ExerciseClock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pronto?',
          style: TextStyleHelper.exercisePhraseIDLE(context),
        ),
        Text('00:00', style: TextStyleHelper.exerciseClockTextIDLE(context))
      ],
    );
  }
}
