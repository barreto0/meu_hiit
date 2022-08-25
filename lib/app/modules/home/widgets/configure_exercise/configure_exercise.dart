import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_hiit/app/modules/commom_widgets/meu_hiit_bottom_sheet.dart';
import 'package:meu_hiit/app/modules/commom_widgets/meu_hiit_button.dart';
import 'package:meu_hiit/app/modules/helpers/screen_helper.dart';
import 'package:meu_hiit/app/modules/helpers/text_style_helper.dart';
import 'package:meu_hiit/app/modules/home/widgets/configure_exercise/configure_exercise_item.dart';

import '../../home_store.dart';

class ConfigureExercise extends StatelessWidget {
  ConfigureExercise({Key? key}) : super(key: key);
  HomeStore homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MeuHiitBottomSheet().getBottomSheet(
          context: context,
          content: Padding(
            padding: EdgeInsets.all(
              ScreenHelper.screenHeightPercentage(context, 2.5),
            ),
            child: Observer(
              builder: (builder) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConfigureExerciseItem(
                        label: 'Exercício',
                        count: homeStore
                            .formatTimer(homeStore.exerciseTimerConfigBuffer),
                        add: () {
                          homeStore.increaseExerciseTimer();
                        },
                        subtract: () {
                          homeStore.decreaseExerciseTimer();
                        }),
                    ConfigureExerciseItem(
                        label: 'Descanso',
                        count: homeStore
                            .formatTimer(homeStore.restTimerConfigBuffer),
                        add: () {
                          homeStore.increaseRestTimer();
                        },
                        subtract: () {
                          homeStore.decreaseRestTimer();
                        }),
                    ConfigureExerciseItem(
                        label: 'Rounds',
                        count: homeStore.totalRoundsConfigBuffer.toString(),
                        add: () {
                          homeStore.increaseTotalRounds();
                        },
                        subtract: () {
                          homeStore.decreaseTotalRounds();
                        }),
                    ConfigureExerciseItem(
                        label: 'Ciclos',
                        count: homeStore.totalCyclesConfigBuffer.toString(),
                        add: () {
                          homeStore.increaseTotalCycles();
                        },
                        subtract: () {
                          homeStore.decreaseTotalCycles();
                        }),
                    SizedBox(
                      height: ScreenHelper.screenHeightPercentage(context, 2),
                    ),
                    MeuHiitButton(
                      width: ScreenHelper.screenWidth(context),
                      onPressed: () {
                        homeStore.saveExerciseConfig();
                        Modular.to.pop();
                      },
                      label: 'Salvar',
                      color: '#79FF6D',
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
      child: Text(
        'Configurar exercício',
        style: TextStyleHelper.configureExercise(context),
      ),
    );
  }
}
