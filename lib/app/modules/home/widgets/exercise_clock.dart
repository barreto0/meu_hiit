import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_hiit/app/modules/enums/exercise_state.dart';
import 'package:meu_hiit/app/modules/helpers/text_style_helper.dart';
import 'package:meu_hiit/app/modules/home/home_store.dart';

class ExerciseClock extends StatefulWidget {
  const ExerciseClock({Key? key}) : super(key: key);

  @override
  State<ExerciseClock> createState() => _ExerciseClockState();
}

class _ExerciseClockState extends State<ExerciseClock> {
  HomeStore homeStore = Modular.get<HomeStore>();

  bool isRestState() {
    if (homeStore.exerciseState == ExerciseState.REST ||
        homeStore.exerciseState == ExerciseState.PAUSED_REST) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (builder) {
      return Column(
        children: [
          Text(
            homeStore.getEffectPhrase()['label'],
            textAlign: TextAlign.center,
            style: TextStyleHelper.exercisePhraseIDLE(
                context: context, color: homeStore.getEffectPhrase()['color']),
          ),
          Text(
            isRestState()
                ? homeStore.formatTimer(homeStore.restTimer)
                : homeStore.formatTimer(homeStore.exerciseTimer),
            style: TextStyleHelper.exerciseClockTextIDLE(
                context: context, color: homeStore.getEffectPhrase()['color']),
          )
        ],
      );
    });
  }
}
