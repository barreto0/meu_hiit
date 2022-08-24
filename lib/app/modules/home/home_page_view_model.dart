import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_hiit/app/modules/home/home_store.dart';
import 'package:meu_hiit/app/modules/home/widgets/configure_exercise/configure_exercise.dart';

import '../commom_widgets/meu_hiit_button.dart';
import '../helpers/screen_helper.dart';
import 'home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  HomeStore homeStore = Modular.get<HomeStore>();

  Widget showConfigureExercise() {
    if (homeStore.exerciseStarted || homeStore.exercisePaused) {
      return Container();
    }
    return ConfigureExercise();
  }

  Widget getExerciseButton() {
    String label = homeStore.getExerciseButtonConfig()['label'];
    String color = homeStore.getExerciseButtonConfig()['color'];
    int state = homeStore.getTimerState();
    return MeuHiitButton(
      width: ScreenHelper.screenWidth(context),
      onPressed: () {
        switch (state) {
          case 0:
            //idle
            homeStore.startTimer();
            break;
          case 1:
            //rolando
            homeStore.pauseTimer();
            break;
          case 2:
            //pausado
            homeStore.continueTimer();
            break;
          case 3:
            //acabou
            break;
        }
      },
      label: label,
      color: color,
    );
  }

  Widget getStopAndSkipButtons() {
    int state = homeStore.getTimerState();
    if (state == 1 || state == 2) {
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
