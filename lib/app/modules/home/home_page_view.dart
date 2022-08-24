import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_hiit/app/modules/commom_widgets/meu_hiit_appbar.dart';
import 'package:meu_hiit/app/modules/helpers/color_helper.dart';
import 'package:meu_hiit/app/modules/helpers/screen_helper.dart';
import 'package:meu_hiit/app/modules/home/widgets/exercise_clock.dart';
import 'package:meu_hiit/app/modules/home/widgets/round_cycle_counter.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.lightGray(),
      appBar: MeuHiitAppbar(title: 'Exercício', hasGoBack: false),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidthPercentage(context, 3),
              vertical: ScreenHelper.screenHeightPercentage(context, 5)),
          child: Observer(builder: (builder) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    RoundCycleCounter(
                      title: 'Rounds',
                    ),
                    RoundCycleCounter(
                      title: 'Ciclos',
                    ),
                  ],
                ),
                const ExerciseClock(),
                Column(
                  children: [
                    getExerciseButton(),
                    getStopAndSkipButtons(),
                    SizedBox(
                      height: ScreenHelper.screenHeightPercentage(context, 4),
                    ),
                    showConfigureExercise()
                  ],
                )
              ],
            );
          })),
    );
  }
}
