import 'dart:async';

import 'package:meu_hiit/app/modules/enums/exercise_state.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  Timer? timer;
  Timer? rTimer;

  @observable
  ExerciseState exerciseState = ExerciseState.IDLE;

  @observable
  int exerciseTimer = 60;

  @observable
  int exerciseTimerConfigBuffer = 60;

  @observable
  int restTimer = 30;

  @observable
  int restTimerConfigBuffer = 30;

  @observable
  int totalRounds = 6;

  @observable
  int totalRoundsConfigBuffer = 6;

  @observable
  int totalCycles = 6;

  @observable
  int totalCyclesConfigBuffer = 6;

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
  startExerciseTimer() {
    exerciseState = ExerciseState.STARTED;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (exerciseTimer == 0) {
          timer.cancel();
          if (currentRound < totalRounds) {
            exerciseState = ExerciseState.REST;
            startRestTimer();
          }
          if (currentRound == totalRounds) {
            exerciseState = ExerciseState.FINISHED;
          }
        } else {
          exerciseTimer--;
        }
      },
    );
  }

  @action
  void pauseExerciseTimer() {
    exerciseState = ExerciseState.PAUSED;
    timer?.cancel();
  }

  @action
  void continueExerciseTimer() {
    exerciseState = ExerciseState.STARTED;
    startExerciseTimer();
  }

  @action
  void stopExerciseTimer() {
    exerciseState = ExerciseState.IDLE;
    timer?.cancel();
    exerciseTimer = 60;
  }

  @action
  startRestTimer() {
    exerciseState = ExerciseState.REST;
    const oneSec = Duration(seconds: 1);
    rTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (restTimer == 0) {
          timer.cancel();
          exerciseState = ExerciseState.STARTED;
          startExerciseTimer();
          exerciseTimer = exerciseTimerConfigBuffer;
          restTimer = restTimerConfigBuffer;
          currentRound++;
        } else {
          restTimer--;
        }
      },
    );
  }

  @action
  void pauseRestTimer() {
    exerciseState = ExerciseState.PAUSED;
    rTimer?.cancel();
  }

  @action
  void stopRestTimer() {
    exerciseState = ExerciseState.IDLE;
    rTimer?.cancel();
    restTimer = 30;
  }

  @action
  exerciseRoutine() async {
    for (int i = 0; i < totalCycles; i++) {
      for (int j = 0; j < totalRounds; j++) {
        await startExerciseTimer();
        await startRestTimer();
        currentRound++;
      }
      currentCycle++;
    }
  }

  @action
  void resetExercise() {
    exerciseState = ExerciseState.IDLE;
    exerciseTimer = exerciseTimerConfigBuffer;
    restTimer = restTimerConfigBuffer;
    totalRounds = totalRoundsConfigBuffer;
    totalCycles = totalCyclesConfigBuffer;
    currentRound = 1;
    currentCycle = 6;
  }

  Map getExerciseButtonConfig() {
    Map buttonConfig = {'label': 'Começar!', 'color': '#79FF6D'};
    if (exerciseState == ExerciseState.STARTED) {
      //exercicio rolando
      return buttonConfig = {'label': 'Pausar', 'color': '#FFF06D'};
    }
    if (exerciseState == ExerciseState.PAUSED) {
      //exercicio pausado
      return buttonConfig = {'label': 'Retomar', 'color': '#FFF06D'};
    }
    if (exerciseState == ExerciseState.REST) {
      //tempo de descanso
      return buttonConfig = {'label': 'Pausar', 'color': '#6DFFF6'};
    }
    if (exerciseState == ExerciseState.FINISHED) {
      //exercicio acabou
      return buttonConfig = {'label': 'Finalizar', 'color': '#79FF6D'};
    }
    return buttonConfig;
  }

  Map getEffectPhrase() {
    Map effectPhraseStyle = {'label': 'Pronto?', 'color': '#FFFFFF'};
    if (exerciseState == ExerciseState.STARTED) {
      //exercicio rolando
      return effectPhraseStyle = {'label': 'Força!', 'color': '#79FF6D'};
    }
    if (exerciseState == ExerciseState.PAUSED) {
      //exercicio pausado
      return {'label': 'Pausado', 'color': '#FFF06D'};
    }
    if (exerciseState == ExerciseState.REST) {
      //tempo de descanso
      return {'label': 'Devagar', 'color': '#6DFFF6'};
    }
    if (exerciseState == ExerciseState.FINISHED) {
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
