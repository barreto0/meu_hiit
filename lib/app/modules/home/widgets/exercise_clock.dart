import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_hiit/app/modules/helpers/text_style_helper.dart';
import 'package:meu_hiit/app/modules/home/home_store.dart';

class ExerciseClock extends StatefulWidget {
  const ExerciseClock({Key? key}) : super(key: key);

  @override
  State<ExerciseClock> createState() => _ExerciseClockState();
}

class _ExerciseClockState extends State<ExerciseClock> {
  HomeStore homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (builder) {
      return Column(
        children: [
          Text(
            'Pronto?',
            style: TextStyleHelper.exercisePhraseIDLE(context),
          ),
          Text(
            homeStore.formatExerciseTimer(),
            style: TextStyleHelper.exerciseClockTextIDLE(context),
          )
        ],
      );
    });
  }
}
