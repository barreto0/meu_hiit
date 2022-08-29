import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meu_hiit/app/modules/enums/exercise_state.dart';
import 'package:meu_hiit/app/modules/home/home_store.dart';
import 'package:meu_hiit/app/modules/home/widgets/configure_exercise/configure_exercise.dart';

import '../commom_widgets/meu_hiit_button.dart';
import '../helpers/screen_helper.dart';
import 'home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  HomeStore homeStore = Modular.get<HomeStore>();

  @override
  void initState() {
    homeStore.initAdsHome();
    //initMusicPlayer();
    super.initState();
  }

  @override
  void dispose() {
    homeStore.disposeAdsHome();
    homeStore.killMusicPlayer();
    super.dispose();
  }

  Widget showConfigureExercise() {
    ExerciseState state = homeStore.exerciseState;
    if (state == ExerciseState.IDLE) {
      return ConfigureExercise();
    }
    return Container();
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
            homeStore.startExerciseTimer();
            break;
          case ExerciseState.STARTED:
            homeStore.pauseExerciseTimer();
            break;
          case ExerciseState.REST:
            homeStore.pauseRestTimer();
            break;
          case ExerciseState.PAUSED_REST:
            homeStore.continueRestTimer();
            break;
          case ExerciseState.PAUSED:
            homeStore.continueExerciseTimer();
            break;
          case ExerciseState.FINISHED:
            homeStore.resetExercise(ExerciseState.IDLE);
            break;
        }
      },
      label: label,
      color: color,
    );
  }

  Widget getStopAndSkipButtons() {
    ExerciseState state = homeStore.exerciseState;
    if (state != ExerciseState.IDLE && state != ExerciseState.FINISHED) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MeuHiitButton(
            width: ScreenHelper.screenWidthPercentage(context, 45),
            onPressed: () {
              homeStore.stopExerciseTimer();
            },
            label: 'Abandonar',
            color: '#FF6D6D',
          ),
          MeuHiitButton(
            width: ScreenHelper.screenWidthPercentage(context, 45),
            onPressed: () {
              homeStore.skipExerciseOrRest();
            },
            label: 'Pular',
            color: '#706DFF',
          ),
        ],
      );
    }
    return Container();
  }
}
