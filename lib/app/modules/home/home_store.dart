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

  @observable
  int totalRounds = 6;

  @observable
  int totalCycles = 6;

  @observable
  int currentRound = 1;

  @observable
  int currentCycle = 1;

  @action
  void increaseExerciseTimer() {
    if (exerciseTimer < 3600) exerciseTimer++;
  }

  @action
  void decreaseExerciseTimer() {
    if (exerciseTimer > 10) exerciseTimer--;
  }

  @action
  void increaseRestTimer() {
    if (restTimer < 3600) restTimer++;
  }

  @action
  void decreaseRestTimer() {
    if (restTimer > 10) restTimer--;
  }

  @action
  void increaseTotalRounds() {
    if (totalRounds < 100) totalRounds++;
  }

  @action
  void decreaseTotalRounds() {
    if (totalRounds > 1) totalRounds--;
  }

  @action
  void increaseTotalCycles() {
    if (totalCycles < 100) totalCycles++;
  }

  @action
  void decreaseTotalCycles() {
    if (totalCycles > 1) totalCycles--;
  }

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

  int getTimerState() {
    if (exerciseStarted && !exerciseEnded && !exercisePaused) {
      //exercicio rolando
      return 1;
    }
    if (exerciseStarted && !exerciseEnded && exercisePaused) {
      //exercicio pausado
      return 2;
    }
    if (!exerciseStarted && exerciseEnded && !exercisePaused) {
      //exercicio acabou
      return 3;
    }
    return 0;
  }

  Map getExerciseButtonConfig() {
    Map buttonConfig = {'label': 'Começar!', 'color': '#79FF6D'};
    if (getTimerState() == 1) {
      //exercicio rolando
      return buttonConfig = {'label': 'Pausar', 'color': '#FFF06D'};
    }
    if (getTimerState() == 2) {
      //exercicio pausado
      return buttonConfig = {'label': 'Retomar', 'color': '#FFF06D'};
    }
    if (getTimerState() == 3) {
      //exercicio acabou
      return buttonConfig = {'label': 'Recomeçar', 'color': '#79FF6D'};
    }
    return buttonConfig;
  }

  Map getEffectPhrase() {
    Map effectPhraseStyle = {'label': 'Pronto?', 'color': '#FFFFFF'};
    if (getTimerState() == 1) {
      //exercicio rolando
      return effectPhraseStyle = {'label': 'Força!', 'color': '#79FF6D'};
    }
    if (getTimerState() == 2) {
      //exercicio pausado
      return {'label': 'Pausado', 'color': '#FFF06D'};
    }
    if (getTimerState() == 3) {
      //exercicio acabou
      return {'label': 'Exercício finalizado!', 'color': '#FFFFFF'};
    }
    return effectPhraseStyle;
  }

  String formatTimer(String timerType) {
    if (timerType == 'exercise') {
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
    if (restTimer == 0) {
      return '00:00';
    }
    if (restTimer < 10) {
      return '00:0$restTimer';
    }
    if (restTimer >= 10 && restTimer < 60) {
      return '00:$restTimer';
    }
    String durationFromExercise = Duration(seconds: restTimer).toString();
    String formatedFullDuration =
        durationFromExercise.split('.')[0].padLeft(8, '0');
    String formatedMinutesAndSecondsDuration =
        '${formatedFullDuration.split(':')[1]}:${formatedFullDuration.split(':')[2]}';
    return formatedMinutesAndSecondsDuration;
  }
}
