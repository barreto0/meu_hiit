import 'dart:async';

import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  Timer? timer;

  @observable
  bool exerciseStarted = false;

  @observable
  bool exercisePaused = false;

  @observable
  bool exerciseEnded = false;

  @observable
  int exerciseTimer = 60;

  @observable
  int restTimer = 30;

  @action
  void startTimer() {
    exerciseStarted = true;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (exerciseTimer == 0) {
          timer.cancel();
          exerciseStarted = false;
          exerciseEnded = true;
        } else {
          exerciseTimer--;
        }
      },
    );
  }

  @action
  void pauseTimer() {
    exercisePaused = true;
    timer?.cancel();
  }

  @action
  void continueTimer() {
    exercisePaused = false;
    startTimer();
  }

  @action
  void stopTimer() {
    exerciseStarted = false;
    exerciseEnded = false;
    exercisePaused = false;
    timer?.cancel();
    exerciseTimer = 60;
  }

  Map getExerciseButtonConfig() {
    Map buttonConfig = {'label': 'Começar!', 'color': '#79FF6D', 'state': 0};
    if (exerciseStarted && !exerciseEnded && !exercisePaused) {
      //exercicio rolando
      return buttonConfig = {'label': 'Pausar', 'color': '#FFF06D', 'state': 1};
    }
    if (exerciseStarted && !exerciseEnded && exercisePaused) {
      //exercicio pausado
      return buttonConfig = {
        'label': 'Retomar',
        'color': '#FFF06D',
        'state': 2
      };
    }
    if (!exerciseStarted && exerciseEnded && !exercisePaused) {
      //exercicio acabou
      return buttonConfig = {
        'label': 'Recomeçar',
        'color': '#79FF6D',
        'state': 3
      };
    }
    return buttonConfig;
  }

  String formatExerciseTimer() {
    if (exerciseTimer == 0) {
      return '00:00';
    }
    if (exerciseTimer < 10) {
      return '00:0$exerciseTimer';
    }
    if (exerciseTimer >= 10 && exerciseTimer < 60) {
      return '00:$exerciseTimer';
    }
    String durationFromExercise = Duration(seconds: exerciseTimer).toString();
    String formatedFullDuration =
        durationFromExercise.split('.')[0].padLeft(8, '0');
    String formatedMinutesAndSecondsDuration =
        '${formatedFullDuration.split(':')[1]}:${formatedFullDuration.split(':')[2]}';
    return formatedMinutesAndSecondsDuration;
  }
}
