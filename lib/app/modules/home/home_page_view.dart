import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meu_hiit/app/modules/commom_widgets/meu_hiit_appbar.dart';
import 'package:meu_hiit/app/modules/helpers/screen_helper.dart';
import 'package:meu_hiit/app/modules/home/widgets/exercise_clock.dart';
import 'package:meu_hiit/app/modules/home/widgets/round_cycle_counter.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MeuHiitAppbar(title: 'Exercício', hasGoBack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidthPercentage(context, 3),
            vertical: ScreenHelper.screenHeightPercentage(context, 5)),
        child: Observer(
          builder: (builder) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundCycleCounter(
                      title: 'Rounds',
                      current: homeStore.currentRound.toString(),
                      total: homeStore.totalRounds.toString(),
                    ),
                    RoundCycleCounter(
                      title: 'Ciclos',
                      current: homeStore.currentCycle.toString(),
                      total: homeStore.totalCycles.toString(),
                    ),
                  ],
                ),
                const ExerciseClock(),
                Column(
                  children: [
                    getExerciseButton(),
                    SizedBox(
                      height: ScreenHelper.screenHeightPercentage(context, 2),
                    ),
                    getStopAndSkipButtons(),
                    SizedBox(
                      height: ScreenHelper.screenHeightPercentage(context, 4),
                    ),
                    showConfigureExercise()
                  ],
                ),
                if (homeStore.bannerAd != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: homeStore.bannerAd!.size.width.toDouble(),
                      height: homeStore.bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: homeStore.bannerAd!),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
