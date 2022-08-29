// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$exerciseStateAtom =
      Atom(name: 'HomeStoreBase.exerciseState', context: context);

  @override
  ExerciseState get exerciseState {
    _$exerciseStateAtom.reportRead();
    return super.exerciseState;
  }

  @override
  set exerciseState(ExerciseState value) {
    _$exerciseStateAtom.reportWrite(value, super.exerciseState, () {
      super.exerciseState = value;
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

  late final _$exerciseTimerConfigBufferAtom =
      Atom(name: 'HomeStoreBase.exerciseTimerConfigBuffer', context: context);

  @override
  int get exerciseTimerConfigBuffer {
    _$exerciseTimerConfigBufferAtom.reportRead();
    return super.exerciseTimerConfigBuffer;
  }

  @override
  set exerciseTimerConfigBuffer(int value) {
    _$exerciseTimerConfigBufferAtom
        .reportWrite(value, super.exerciseTimerConfigBuffer, () {
      super.exerciseTimerConfigBuffer = value;
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

  late final _$restTimerConfigBufferAtom =
      Atom(name: 'HomeStoreBase.restTimerConfigBuffer', context: context);

  @override
  int get restTimerConfigBuffer {
    _$restTimerConfigBufferAtom.reportRead();
    return super.restTimerConfigBuffer;
  }

  @override
  set restTimerConfigBuffer(int value) {
    _$restTimerConfigBufferAtom.reportWrite(value, super.restTimerConfigBuffer,
        () {
      super.restTimerConfigBuffer = value;
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

  late final _$totalRoundsConfigBufferAtom =
      Atom(name: 'HomeStoreBase.totalRoundsConfigBuffer', context: context);

  @override
  int get totalRoundsConfigBuffer {
    _$totalRoundsConfigBufferAtom.reportRead();
    return super.totalRoundsConfigBuffer;
  }

  @override
  set totalRoundsConfigBuffer(int value) {
    _$totalRoundsConfigBufferAtom
        .reportWrite(value, super.totalRoundsConfigBuffer, () {
      super.totalRoundsConfigBuffer = value;
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

  late final _$totalCyclesConfigBufferAtom =
      Atom(name: 'HomeStoreBase.totalCyclesConfigBuffer', context: context);

  @override
  int get totalCyclesConfigBuffer {
    _$totalCyclesConfigBufferAtom.reportRead();
    return super.totalCyclesConfigBuffer;
  }

  @override
  set totalCyclesConfigBuffer(int value) {
    _$totalCyclesConfigBufferAtom
        .reportWrite(value, super.totalCyclesConfigBuffer, () {
      super.totalCyclesConfigBuffer = value;
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

  late final _$bannerAdAtom =
      Atom(name: 'HomeStoreBase.bannerAd', context: context);

  @override
  BannerAd? get bannerAd {
    _$bannerAdAtom.reportRead();
    return super.bannerAd;
  }

  @override
  set bannerAd(BannerAd? value) {
    _$bannerAdAtom.reportWrite(value, super.bannerAd, () {
      super.bannerAd = value;
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
  void increaseRestTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.increaseRestTimer');
    try {
      return super.increaseRestTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseRestTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.decreaseRestTimer');
    try {
      return super.decreaseRestTimer();
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
  void saveExerciseConfig() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.saveExerciseConfig');
    try {
      return super.saveExerciseConfig();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startExerciseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.startExerciseTimer');
    try {
      return super.startExerciseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startRestTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.startRestTimer');
    try {
      return super.startRestTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextRound() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.nextRound');
    try {
      return super.nextRound();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetRound() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetRound');
    try {
      return super.resetRound();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void skipExerciseOrRest() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.skipExerciseOrRest');
    try {
      return super.skipExerciseOrRest();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextCycle() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.nextCycle');
    try {
      return super.nextCycle();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseExerciseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.pauseExerciseTimer');
    try {
      return super.pauseExerciseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void continueExerciseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.continueExerciseTimer');
    try {
      return super.continueExerciseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopExerciseTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.stopExerciseTimer');
    try {
      return super.stopExerciseTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseRestTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.pauseRestTimer');
    try {
      return super.pauseRestTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void continueRestTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.continueRestTimer');
    try {
      return super.continueRestTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopRestTimer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.stopRestTimer');
    try {
      return super.stopRestTimer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetExercise(ExerciseState state) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetExercise');
    try {
      return super.resetExercise(state);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initAdsHome() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.initAdsHome');
    try {
      return super.initAdsHome();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeAdsHome() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.disposeAdsHome');
    try {
      return super.disposeAdsHome();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exerciseState: ${exerciseState},
exerciseTimer: ${exerciseTimer},
exerciseTimerConfigBuffer: ${exerciseTimerConfigBuffer},
restTimer: ${restTimer},
restTimerConfigBuffer: ${restTimerConfigBuffer},
totalRounds: ${totalRounds},
totalRoundsConfigBuffer: ${totalRoundsConfigBuffer},
totalCycles: ${totalCycles},
totalCyclesConfigBuffer: ${totalCyclesConfigBuffer},
currentRound: ${currentRound},
currentCycle: ${currentCycle},
bannerAd: ${bannerAd}
    ''';
  }
}
