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
    return const ConfigureExercise();
  }

  Widget getExerciseButton() {
    String label = homeStore.getExerciseButtonConfig()['label'];
    String color = homeStore.getExerciseButtonConfig()['color'];
    int state = homeStore.getExerciseButtonConfig()['state'];
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
}
