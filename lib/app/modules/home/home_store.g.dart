// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$exerciseStartedAtom =
      Atom(name: 'HomeStoreBase.exerciseStarted', context: context);

  @override
  bool get exerciseStarted {
    _$exerciseStartedAtom.reportRead();
    return super.exerciseStarted;
  }

  @override
  set exerciseStarted(bool value) {
    _$exerciseStartedAtom.reportWrite(value, super.exerciseStarted, () {
      super.exerciseStarted = value;
    });
  }

  late final _$exercisePausedAtom =
      Atom(name: 'HomeStoreBase.exercisePaused', context: context);

  @override
  bool get exercisePaused {
    _$exercisePausedAtom.reportRead();
    return super.exercisePaused;
  }

  @override
  set exercisePaused(bool value) {
    _$exercisePausedAtom.reportWrite(value, super.exercisePaused, () {
      super.exercisePaused = value;
    });
  }

  late final _$exerciseEndedAtom =
      Atom(name: 'HomeStoreBase.exerciseEnded', context: context);

  @override
  bool get exerciseEnded {
    _$exerciseEndedAtom.reportRead();
    return super.exerciseEnded;
  }

  @override
  set exerciseEnded(bool value) {
    _$exerciseEndedAtom.reportWrite(value, super.exerciseEnded, () {
      super.exerciseEnded = value;
    });
  }

  late final _$exerciseTimerAtom =
      Atom(name: 'HomeStoreBase.exerciseTimer', context: context);

  @override
  int get exerciseTimer {
    _$exerciseTimerAtom.reportRead();
    return super.exerciseTimer;
  }

  @override
  set exerciseTimer(int value) {
    _$exerciseTimerAtom.reportWrite(value, super.exerciseTimer, () {
      super.exerciseTimer = value;
    });
  }

  late final _$restTimerAtom =
      Atom(name: 'HomeStoreBase.restTimer', context: context);

  @override
  int get restTimer {
    _$restTimerAtom.reportRead();
    return super.restTimer;
  }

  @override
  set restTimer(int value) {
    _$restTimerAtom.reportWrite(value, super.restTimer, () {
      super.restTimer = value;
    });
  }

  late final _$totalRoundsAtom =
      Atom(name: 'HomeStoreBase.totalRounds', context: context);

  @override
  int get totalRounds {
    _$totalRoundsAtom.reportRead();
    return super.totalRounds;
  }

  @override
  set totalRounds(int value) {
    _$totalRoundsAtom.reportWrite(value, super.totalRounds, () {
      super.totalRounds = value;
    });
  }

  late final _$totalCyclesAtom =
      Atom(name: 'HomeStoreBase.totalCycles', context: context);

  @override
  int get totalCycles {
    _$totalCyclesAtom.reportRead();
    return super.totalCycles;
  }

  @override
  set totalCycles(int value) {
    _$totalCyclesAtom.reportWrite(value, super.totalCycles, () {
      super.totalCycles = value;
    });
  }

  late final _$currentRoundAtom =
      Atom(name: 'HomeStoreBase.currentRound', context: context);

  @override
  int get currentRound {
    _$currentRoundAtom.reportRead();
    return super.currentRound;
  }

  @override
  set currentRound(int value) {
    _$currentRoundAtom.reportWrite(value, super.currentRound, () {
      super.currentRound = value;
    });
  }

  late final _$currentCycleAtom =
      Atom(name: 'HomeStoreBase.currentCycle', context: context);

  @override
  int get currentCycle {
    _$currentCycleAtom.reportRead();
    return super.currentCycle;
  }

  @override
  set currentCycle(int value) {
    _$currentCycleAtom.reportWrite(value, super.currentCycle, () {
      super.currentCycle = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void increaseExerciseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.increaseExerciseTimer');
    try {
      return super.increaseExerciseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseExerciseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.decreaseExerciseTimer');
    try {
      return super.decreaseExerciseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseTotalRounds() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.increaseTotalRounds');
    try {
      return super.increaseTotalRounds();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseTotalRounds() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.decreaseTotalRounds');
    try {
      return super.decreaseTotalRounds();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseTotalCycles() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.increaseTotalCycles');
    try {
      return super.increaseTotalCycles();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseTotalCycles() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.decreaseTotalCycles');
    try {
      return super.decreaseTotalCycles();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.pauseTimer');
    try {
      return super.pauseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void continueTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.continueTimer');
    try {
      return super.continueTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exerciseStarted: ${exerciseStarted},
exercisePaused: ${exercisePaused},
exerciseEnded: ${exerciseEnded},
exerciseTimer: ${exerciseTimer},
restTimer: ${restTimer},
totalRounds: ${totalRounds},
totalCycles: ${totalCycles},
currentRound: ${currentRound},
currentCycle: ${currentCycle}
    ''';
  }
}
