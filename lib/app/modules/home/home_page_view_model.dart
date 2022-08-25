import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_hiit/app/modules/enums/exercise_state.dart';
import 'package:meu_hiit/app/modules/home/home_store.dart';
import 'package:meu_hiit/app/modules/home/widgets/configure_exercise/configure_exercise.dart';

import '../commom_widgets/meu_hiit_button.dart';
import '../helpers/screen_helper.dart';
import 'home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  HomeStore homeStore = Modular.get<HomeStore>();

  Widget showConfigureExercise() {
    ExerciseState state = homeStore.exerciseState;
    if (state == ExerciseState.STARTED || state == ExerciseState.PAUSED) {
      return Container();
    }
    return ConfigureExercise();
  }

  Widget getExerciseButton() {
    String label = homeStore.getExerciseButtonConfig()['label'];
    String color = homeStore.getExerciseButtonConfig()['color'];
    ExerciseState state = homeStore.exerciseState;
    return MeuHiitButton(
      width: ScreenHelper.screenWidth(context),
      onPressed: () {
        switch (state) {
          case ExerciseState.IDLE:
            //idle
            homeStore.startTimer();
            break;
          case ExerciseState.STARTED:
            homeStore.pauseTimer();
            break;
          case ExerciseState.REST:
            // TODO: Handle this case.
            break;
          case ExerciseState.PAUSED:
            homeStore.continueTimer();
            break;
          case ExerciseState.FINISHED:
            // TODO: Handle this case.
            break;
        }
      },
      label: label,
      color: color,
    );
  }

  Widget getStopAndSkipButtons() {
    ExerciseState state = homeStore.exerciseState;
    if (state == ExerciseState.STARTED || state == ExerciseState.PAUSED) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MeuHiitButton(
            width: ScreenHelper.screenWidthPercentage(context, 45),
            onPressed: () {
              homeStore.stopTimer();
            },
            label: 'Parar',
            color: '#FF6D6D',
          ),
          MeuHiitButton(
            width: ScreenHelper.screenWidthPercentage(context, 45),
            onPressed: () {},
            label: 'Pular',
            color: '#706DFF',
          ),
        ],
      );
    }
    return Container();
  }
}
