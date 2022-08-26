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
    if (exerciseTimerConfigBuffer < 3600) exerciseTimerConfigBuffer++;
  }

  @action
  void decreaseExerciseTimer() {
    if (exerciseTimerConfigBuffer > 10) exerciseTimerConfigBuffer--;
  }

  @action
  void increaseRestTimer() {
    if (restTimerConfigBuffer < 3600) restTimerConfigBuffer++;
  }

  @action
  void decreaseRestTimer() {
    if (restTimerConfigBuffer > 10) restTimerConfigBuffer--;
  }

  @action
  void increaseTotalRounds() {
    if (totalRoundsConfigBuffer < 100) totalRoundsConfigBuffer++;
  }

  @action
  void decreaseTotalRounds() {
    if (totalRoundsConfigBuffer > 1) totalRoundsConfigBuffer--;
  }

  @action
  void increaseTotalCycles() {
    if (totalCyclesConfigBuffer < 100) totalCyclesConfigBuffer++;
  }

  @action
  void decreaseTotalCycles() {
    if (totalCyclesConfigBuffer > 1) totalCyclesConfigBuffer--;
  }

  @action
  void saveExerciseConfig() {
    exerciseTimer = exerciseTimerConfigBuffer;
    restTimer = restTimerConfigBuffer;
    totalRounds = totalRoundsConfigBuffer;
    totalCycles = totalCyclesConfigBuffer;
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
          startRestTimer();
        } else {
          exerciseTimer--;
        }
      },
    );
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
          nextRound();
        } else {
          restTimer--;
        }
      },
    );
  }

  @action
  void nextRound() {
    if (currentRound < totalRounds) {
      currentRound++;
      exerciseTimer = exerciseTimerConfigBuffer;
      restTimer = restTimerConfigBuffer;
      startExerciseTimer();
      return;
    }
    if (currentRound == totalRounds) {
      nextCycle();
      return;
    }
  }

  @action
  void resetRound() {
    timer?.cancel();
    rTimer?.cancel();
    exerciseTimer = exerciseTimerConfigBuffer;
    restTimer = restTimerConfigBuffer;
  }

  @action
  void skipExerciseOrRest() {
    if (currentRound == totalRounds) {
      if (exerciseState == ExerciseState.REST) {
        nextCycle();
        return;
      }
      if (exerciseState == ExerciseState.REST) {
        if (currentCycle == totalCycles) {
          stopExerciseTimer();
          return;
        }
      }
      resetRound();
      startRestTimer();
      exerciseState = ExerciseState.REST;
      return;
    }
    if (exerciseState == ExerciseState.STARTED ||
        exerciseState == ExerciseState.PAUSED) {
      resetRound();
      startRestTimer();
      exerciseState = ExerciseState.REST;
      return;
    }
    if (exerciseState == ExerciseState.REST ||
        exerciseState == ExerciseState.PAUSED_REST) {
      currentRound++;
      resetRound();
      startExerciseTimer();
      exerciseState = ExerciseState.STARTED;
      return;
    }
  }

  @action
  void nextCycle() {
    if (currentCycle < totalCycles) {
      resetRound();
      currentCycle++;
      currentRound = 1;
      startExerciseTimer();
      exerciseState = ExerciseState.STARTED;
      return;
    }
    if (currentCycle == totalCycles) {
      exerciseState = ExerciseState.FINISHED;
    }
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
    timer?.cancel();
    resetExercise(ExerciseState.FINISHED);
  }

  @action
  void pauseRestTimer() {
    exerciseState = ExerciseState.PAUSED_REST;
    rTimer?.cancel();
  }

  @action
  void continueRestTimer() {
    exerciseState = ExerciseState.STARTED;
    startRestTimer();
  }

  @action
  void stopRestTimer() {
    exerciseState = ExerciseState.IDLE;
    rTimer?.cancel();
    restTimer = restTimerConfigBuffer;
  }

  @action
  void resetExercise(ExerciseState state) {
    exerciseState = state;
    timer?.cancel();
    rTimer?.cancel();
    exerciseTimer = exerciseTimerConfigBuffer;
    restTimer = restTimerConfigBuffer;
    totalRounds = totalRoundsConfigBuffer;
    totalCycles = totalCyclesConfigBuffer;
    currentRound = 1;
    currentCycle = 1;
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
      return buttonConfig = {'label': 'Pausar', 'color': '#FFF06D'};
    }
    if (exerciseState == ExerciseState.PAUSED_REST) {
      //exercicio pausado
      return buttonConfig = {'label': 'Retomar', 'color': '#FFF06D'};
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
    if (exerciseState == ExerciseState.PAUSED_REST) {
      //exercicio pausado
      return {'label': 'Pausado', 'color': '#FFF06D'};
    }
    if (exerciseState == ExerciseState.FINISHED) {
      //exercicio acabou
      return {'label': 'Exercício finalizado!', 'color': '#FFFFFF'};
    }
    return effectPhraseStyle;
  }

  String formatTimer(int timer) {
    if (timer == 0) {
      return '00:00';
    }
    if (timer < 10) {
      return '00:0$timer';
    }
    if (timer >= 10 && timer < 60) {
      return '00:$timer';
    }
    String durationFromExercise = Duration(seconds: timer).toString();
    String formatedFullDuration =
        durationFromExercise.split('.')[0].padLeft(8, '0');
    String formatedMinutesAndSecondsDuration =
        '${formatedFullDuration.split(':')[1]}:${formatedFullDuration.split(':')[2]}';
    return formatedMinutesAndSecondsDuration;
  }
}
